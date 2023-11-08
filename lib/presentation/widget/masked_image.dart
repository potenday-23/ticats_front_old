import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MaskedImage extends StatelessWidget {
  final String imageUrl;
  final String mask;

  const MaskedImage({super.key, required this.imageUrl, required this.mask});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder<List>(
        future: _createShaderAndImage(imageUrl, mask, constraints.maxWidth, constraints.maxHeight),
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

  Future<List> _createShaderAndImage(String imageUrl, String mask, double w, double h) async {
    http.Response reponse = await http.get(Uri.parse(imageUrl));
    ByteData data = reponse.bodyBytes.buffer.asByteData();
    ByteData maskData = await rootBundle.load(mask);

    Codec codec = await instantiateImageCodec(maskData.buffer.asUint8List(), targetWidth: w.toInt(), targetHeight: h.toInt());
    FrameInfo fi = await codec.getNextFrame();

    ImageShader shader = ImageShader(fi.image, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);
    Image image = Image.memory(data.buffer.asUint8List(), fit: BoxFit.cover, width: w, height: h);
    return [shader, image];
  }
}
