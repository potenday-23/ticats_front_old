import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/main/data/enum/color.dart';
import 'package:tickets/presentation/widget/tickets.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';
import 'package:tickets/presentation/widget/tickets_dialog.dart';

import '../controller/make_ticket_controller.dart';

class SelectTicketLayoutScreen extends GetView<MakeTicketController> {
  const SelectTicketLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_left.svg", width: 24.w, height: 24.w),
          onPressed: () => controller.currentIndex.value = 1,
        ),
        title: Text("티켓 만들기"),
        titleTextStyle: AppTypeFace.smallBold.copyWith(color: Colors.black),
      ),
      body: Column(
        children: [
          Center(
            child: Obx(
              () => FlutterToggleTab(
                width: 90,
                height: 48.h,
                marginSelected: controller.selectLayoutTabIndex.value == 0
                    ? EdgeInsets.fromLTRB(4.w, 4.h, 0, 4.h)
                    : controller.selectLayoutTabIndex.value == 1
                        ? EdgeInsets.zero
                        : EdgeInsets.fromLTRB(0.w, 4.h, 4.w, 4.h),
                labels: ["티켓 모양", "레이아웃", "글자 색"],
                icons: [
                  controller.selectLayoutTabIndex.value == 0 ? Icons.check : null,
                  controller.selectLayoutTabIndex.value == 1 ? Icons.check : null,
                  controller.selectLayoutTabIndex.value == 2 ? Icons.check : null,
                ],
                iconSize: 18.w,
                isShadowEnable: false,
                selectedLabelIndex: (index) => controller.selectLayoutTabIndex.value = index,
                selectedIndex: controller.selectLayoutTabIndex.value,
                selectedBackgroundColors: [AppColor.primaryLight],
                selectedTextStyle: AppTypeFace.xsmallMedium.copyWith(color: Colors.white),
                unSelectedBackgroundColors: [AppColor.grayF2],
                unSelectedTextStyle: AppTypeFace.xsmallMedium.copyWith(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Obx(() {
            if (controller.selectLayoutTabIndex.value == 0)
              return const _SelectTicketTypeWidget();
            else if (controller.selectLayoutTabIndex.value == 1)
              return const _SelectTicketLayoutWidget();
            else
              return const _SelectTicketColorWidget();
          }),
          Obx(() {
            if (controller.selectLayoutTabIndex.value == 0)
              return const _SelectTicketTypeView();
            else
              return const _SelectTicketLayoutView();
          }),
        ],
      ),
    );
  }
}

class _SelectTicketTypeWidget extends GetView<MakeTicketController> {
  const _SelectTicketTypeWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38.65.w),
          child: Container(
            width: double.maxFinite,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 3; i++)
                    GestureDetector(
                      onTap: () => controller.selectedType.value = i,
                      child: SvgPicture.asset(
                        controller.selectedType.value == i
                            ? "assets/tickets/ticket_icon_${i + 1}_active.svg"
                            : "assets/tickets/ticket_icon_${i + 1}.svg",
                        width: 65.1.w,
                        height: 99.5.h,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SelectTicketTypeView extends GetView<MakeTicketController> {
  const _SelectTicketTypeView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 12.5.h),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                width: double.maxFinite,
                color: AppColor.grayF2,
                child: Column(
                  children: [
                    Obx(
                      () => Image.asset(
                        "assets/tickets/ticket_${controller.selectedType.value + 1}.png",
                        width: 342.w,
                        height: 576.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: TicketsButton(
                        "다음",
                        onTap: () => controller.selectLayoutTabIndex.value = 1,
                        color: AppColor.primaryNormal,
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectTicketLayoutWidget extends GetView<MakeTicketController> {
  const _SelectTicketLayoutWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38.65.w),
          child: Container(
            width: double.maxFinite,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 3; i++)
                    GestureDetector(
                      onTap: () => controller.selectedLayout.value = i,
                      child: SvgPicture.asset(
                        controller.selectedLayout.value == i
                            ? "assets/tickets/ticket_layout_${i + 1}_active.svg"
                            : "assets/tickets/ticket_layout_${i + 1}.svg",
                        width: 75.w,
                        height: 75.w,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SelectTicketLayoutView extends GetView<MakeTicketController> {
  const _SelectTicketLayoutView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 12.5.h),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                width: double.maxFinite,
                color: AppColor.grayF2,
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (controller.selectedType.value == 0) ...[
                            if (controller.selectedLayout.value == 0)
                              Ticket1Small(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                            if (controller.selectedLayout.value == 1)
                              Ticket1Medium(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                            if (controller.selectedLayout.value == 2)
                              Ticket1Large(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                          ] else if (controller.selectedType.value == 1) ...[
                            if (controller.selectedLayout.value == 0)
                              Ticket2Small(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                            if (controller.selectedLayout.value == 1)
                              Ticket2Medium(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                            if (controller.selectedLayout.value == 2)
                              Ticket2Large(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                          ] else if (controller.selectedType.value == 2) ...[
                            if (controller.selectedLayout.value == 0)
                              Ticket3Small(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                            if (controller.selectedLayout.value == 1)
                              Ticket3Medium(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                            if (controller.selectedLayout.value == 2)
                              Ticket3Large(controller.makeTicketModel.value, width: 343.w, height: 589.h),
                          ]
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: TicketsButton(
                        "티켓 만들기",
                        onTap: () async => await showTicketsDialog(context),
                        color: AppColor.primaryNormal,
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
