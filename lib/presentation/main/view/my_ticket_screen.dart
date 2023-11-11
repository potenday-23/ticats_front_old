import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/main/controller/make_ticket_controller.dart';
import 'package:tickets/presentation/widget/tickets_chip.dart';

import '../controller/ticket_controller.dart';
import 'widget/no_ticket_widget.dart';

class MyTicketScreen extends GetView<TicketController> {
  const MyTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 56.h,
        title: const Text("티켓 등록"),
        titleTextStyle: AppTypeFace.smallBold.copyWith(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Obx(
          () {
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
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 32.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.myTicketList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: SizedBox(
                                  width: 68.w,
                                  height: 68.w,
                                  child: CachedNetworkImage(
                                    imageUrl: controller.myTicketList[index].imageUrl!,
                                    width: 342.w,
                                    height: 70.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 18.w),
                              SizedBox(
                                height: 68.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(controller.myTicketList[index].title, style: AppTypeFace.xsmallSemiBold),
                                    TicketsChip(controller.myTicketList[index].category.name, onTap: () {}, color: AppColor.grayE5),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.all(8.w),
                                  minimumSize: const Size(0, 0),
                                ),
                                onPressed: () {
                                  Get.find<MakeTicketController>().editTicket(controller.myTicketList[index]);
                                },
                                child: Text("수정하기", style: AppTypeFace.xsmallBold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
