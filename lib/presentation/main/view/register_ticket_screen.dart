import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';

import 'package:tickets/presentation/widget/tickets_button.dart';
import 'package:tickets/presentation/widget/tickets_chip.dart';

import '../controller/make_ticket_controller.dart';
import '../data/enum/category.dart';

class RegisterTicketScreen extends GetView<MakeTicketController> {
  const RegisterTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/arrow_left.svg", width: 24.w, height: 24.w),
          onPressed: () => controller.currentIndex.value = 0,
        ),
        title: Text("티켓 만들기"),
        titleTextStyle: AppTypeFace.smallBold.copyWith(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Center(
                child: Obx(
                  () => Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await controller.getImage();
                        },
                        child: controller.imageFile.value!.path.isNotEmpty
                            ? Image.asset(controller.imageFile.value!.path)
                            : Column(
                                children: [
                                  SvgPicture.asset('assets/icons/image.svg', width: 110.w, height: 110.w),
                                  SizedBox(height: 11.h),
                                  Text("이미지는 2:3 비율을 추천드려요!", style: AppTypeFace.smallBold.copyWith(color: AppColor.gray98)),
                                  SizedBox(height: 15.h),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Text("* ", style: AppTypeFace.smallBold.copyWith(color: AppColor.systemError)),
                  Expanded(
                    child: TextField(
                      controller: controller.titleController,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: "티켓 제목을 입력해주세요.",
                        hintStyle: AppTypeFace.smallBold.copyWith(color: AppColor.gray98),
                      ),
                      style: AppTypeFace.smallBold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              _SelectCategoryWidget(),
              SizedBox(height: 32.h),
              _SelectDateWidget(context),
              SizedBox(height: 32.h),
              _SelectRatingWidget(),
              SizedBox(height: 32.h),
              Text("메모를 입력해주세요.", style: AppTypeFace.xsmallMedium),
              SizedBox(height: 10.h),
              Obx(
                () => Stack(
                  children: [
                    TextField(
                      controller: controller.memoController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        counterText: "",
                        filled: true,
                        fillColor: AppColor.grayF2,
                        hintText: "메모를 입력해주세요.",
                        hintStyle: AppTypeFace.smallSemiBold.copyWith(color: AppColor.gray8E),
                      ),
                      style: AppTypeFace.smallSemiBold,
                      onChanged: (value) => controller.memoTextLength.value = value.length,
                      maxLength: 100,
                    ),
                    Positioned.fill(
                      right: 12.w,
                      bottom: 12.h,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text("${controller.memoTextLength.value}/100",
                            style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.gray8E)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Text("어디서 봤나요? 장소를 입력해주세요.", style: AppTypeFace.xsmallMedium),
              TextField(
                controller: controller.locationController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.gray98)),
                  hintText: "장소를 입력하세요.",
                  hintStyle: AppTypeFace.smallSemiBold.copyWith(color: AppColor.gray8E),
                ),
              ),
              SizedBox(height: 32.h),
              Text("누구와 봤나요? 같이 본 사람을 입력해주세요.", style: AppTypeFace.xsmallMedium),
              TextField(
                controller: controller.friendController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.gray98)),
                  hintText: "내용을 입력하세요.",
                  hintStyle: AppTypeFace.smallSemiBold.copyWith(color: AppColor.gray8E),
                ),
                style: AppTypeFace.smallSemiBold,
              ),
              SizedBox(height: 32.h),
              Text("좌석을 입력해주세요.", style: AppTypeFace.xsmallMedium),
              TextField(
                controller: controller.seatController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.gray98)),
                  hintText: "좌석을 입력하세요.",
                  hintStyle: AppTypeFace.smallSemiBold.copyWith(color: AppColor.gray8E),
                ),
                style: AppTypeFace.smallSemiBold,
              ),
              SizedBox(height: 32.h),
              Text("금액을 입력해주세요.", style: AppTypeFace.xsmallMedium),
              TextField(
                controller: controller.priceController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.gray98)),
                  hintText: "금액을 입력하세요.",
                  hintStyle: AppTypeFace.smallSemiBold.copyWith(color: AppColor.gray8E),
                ),
                style: AppTypeFace.smallSemiBold,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 19.h),
              Row(
                children: [
                  SizedBox(
                    width: 126.w,
                    child: TicketsButton(
                      "저장하기",
                      onTap: () {},
                      color: AppColor.grayE5,
                      textColor: Colors.black,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: TicketsButton(
                      "티켓 만들기",
                      onTap: () {
                        controller.saveTicket();
                      },
                      color: AppColor.primaryNormal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectCategoryWidget extends GetView<MakeTicketController> {
  const _SelectCategoryWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(" * ", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.systemError)),
            Text("카테고리를 선택해주세요.", style: AppTypeFace.xsmallMedium),
          ],
        ),
        SizedBox(height: 12.h),
        Obx(
          () => Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              for (CategoryType category in CategoryType.values) ...[
                TicketsChip(
                  category.name,
                  onTap: () => controller.selectedCategory.value = category,
                  color: controller.selectedCategory.value.name == category.name ? AppColor.primaryLight : AppColor.grayE5,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SelectDateWidget extends GetView<MakeTicketController> {
  const _SelectDateWidget(BuildContext this.context);

  final BuildContext context;

  void _showDialog() async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: controller.selectedDate.value,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              controller.selectedDate.value = newDate;
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(" * ", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.systemError)),
            Text("언제 관람했나요?", style: AppTypeFace.xsmallMedium),
          ],
        ),
        SizedBox(height: 12.h),
        Obx(
          () => TicketsChip(
            DateFormat("yyyy년 MM월 dd일 (E)").format(controller.selectedDate.value),
            color: AppColor.grayF2,
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 6.h),
            onTap: () {
              _showDialog();
            },
          ),
        ),
      ],
    );
  }
}

class _SelectRatingWidget extends GetView<MakeTicketController> {
  const _SelectRatingWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(" * ", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.systemError)),
            Text("감상은 어땠나요? 별점을 선택해주세요.", style: AppTypeFace.xsmallMedium),
          ],
        ),
        SizedBox(height: 16.h),
        RatingBar(
          initialRating: 4.5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          glow: false,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: SvgPicture.asset('assets/tickets/star_full.svg', width: 32.w, height: 32.w),
            half: SvgPicture.asset('assets/tickets/star_half.svg', width: 32.w, height: 32.w),
            empty: SvgPicture.asset('assets/tickets/star_empty.svg', width: 32.w, height: 32.w),
          ),
          onRatingUpdate: (rating) => controller.selectedRating.value = rating,
        ),
      ],
    );
  }
}
