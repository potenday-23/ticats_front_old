import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/main/controller/make_ticket_controller.dart';

import '../controller/ticket_controller.dart';
import 'widget/no_ticket_widget.dart';

class MyTicketScreen extends GetView<TicketController> {
  const MyTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        title: Text("티켓 등록"),
        titleTextStyle: AppTypeFace.smallBold.copyWith(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Obx(() {
          if (controller.isMyTicketLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.myTicketList.isEmpty) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => Get.find<MakeTicketController>().currentIndex.value = 1,
                  child: Container(
                    width: 342.w,
                    height: 70.h,
                    color: AppColor.grayF2,
                    child: Center(
                      child: SvgPicture.asset("assets/icons/add.svg", width: 34.w, height: 34.w),
                    ),
                  ),
                ),
                SizedBox(height: 138.h),
                const NoTicketWidget(),
              ],
            );
          } else {
            return SizedBox();
          }
        }),
      ),
    );
  }
}
