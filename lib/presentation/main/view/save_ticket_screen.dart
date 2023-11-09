import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/main/controller/make_ticket_controller.dart';
import 'package:tickets/presentation/widget/tickets.dart';

class SaveTicketScreen extends GetView<MakeTicketController> {
  SaveTicketScreen({super.key});

  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg", width: 24.w, height: 24.w),
            onPressed: () {
              controller.resetTicket();
              controller.currentIndex.value = 0;
            },
          ),
        ],
        title: Text("티켓 만들기"),
        titleTextStyle: AppTypeFace.smallBold.copyWith(color: Colors.black),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.selectedType.value == 0) ...[
                      if (controller.selectedLayout.value == 0) Ticket1Small(controller.makeTicketModel.value),
                      if (controller.selectedLayout.value == 1) Ticket1Medium(controller.makeTicketModel.value),
                      if (controller.selectedLayout.value == 2) Ticket1Large(controller.makeTicketModel.value),
                    ] else if (controller.selectedType.value == 1) ...[
                      if (controller.selectedLayout.value == 0) Ticket2Small(controller.makeTicketModel.value),
                      if (controller.selectedLayout.value == 1) Ticket2Medium(controller.makeTicketModel.value),
                      if (controller.selectedLayout.value == 2) Ticket2Large(controller.makeTicketModel.value),
                    ] else if (controller.selectedType.value == 2) ...[
                      if (controller.selectedLayout.value == 0) Ticket3Small(controller.makeTicketModel.value),
                      if (controller.selectedLayout.value == 1) Ticket3Medium(controller.makeTicketModel.value),
                      if (controller.selectedLayout.value == 2) Ticket3Large(controller.makeTicketModel.value),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity(horizontal: -4, vertical: 0),
        ),
        onPressed: () async {
          await _screenshotController.capture(delay: const Duration(milliseconds: 10)).then((Uint8List? image) async {
            if (image != null) {
              final directory = await getApplicationDocumentsDirectory();
              final imagePath = await File('${directory.path}/image.png').create();
              await imagePath.writeAsBytes(image);

              await Share.shareXFiles([XFile(imagePath.path)]);
            }
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/download.svg', width: 24.w, height: 24.w),
            SizedBox(width: 4.w),
            Text('다운로드', style: AppTypeFace.xsmallBold),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
