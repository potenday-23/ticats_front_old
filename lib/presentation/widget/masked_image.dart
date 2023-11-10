import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

class MaskedImage extends StatelessWidget {
  final String? imageUrl;
  final String? imagePath;
  final String mask;

  const MaskedImage({super.key, this.imageUrl, this.imagePath, required this.mask});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder<List>(
        future: _createShaderAndImage(imageUrl, imagePath, mask, constraints.maxWidth, constraints.maxHeight),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          return ShaderMask(
            blendMode: BlendMode.dstATop,
            shaderCallback: (rect) => snapshot.data![0],
            child: snapshot.data![1],
          );
        },
      );
    });
  }

  Future<List> _createShaderAndImage(String? imageUrl, String? imagePath, String mask, double w, double h) async {
    late ByteData data;

    if (imageUrl != null) {
      File file = await DefaultCacheManager().getSingleFile(imageUrl);

      if (!await file.exists()) {
        await DefaultCacheManager().downloadFile(imageUrl);
      }

      data = await file.readAsBytes().then((value) => value.buffer.asByteData());
    } else {
      data = await rootBundle.load(imagePath!);
    }

    ByteData maskData = await rootBundle.load(mask);

    Codec codec = await instantiateImageCodec(maskData.buffer.asUint8List(), targetWidth: w.toInt(), targetHeight: h.toInt());
    FrameInfo fi = await codec.getNextFrame();

    ImageShader shader = ImageShader(fi.image, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);
    Image image = Image.memory(data.buffer.asUint8List(), fit: BoxFit.cover, width: w, height: h);
    return [shader, image];
  }
}
