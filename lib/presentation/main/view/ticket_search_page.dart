import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/presentation/main/data/enum/category.dart';

import '../../widget/tickets_button.dart';
import '../controller/ticket_search_controller.dart';
import 'widget/search_calendar_dialog.dart';

class TicketSearchPage extends GetView<TicketSearchController> {
  const TicketSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Misc
        automaticallyImplyLeading: false,
        toolbarHeight: 56.w,

        // Empty leading
        leadingWidth: 0,

        // Title
        title: const _FilterTitleTextField(),
        titleSpacing: 0,

        // Actions
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 24.w, 16.h),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.close, size: 24.w),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 티켓만 보기", style: AppTypeFace.smallSemiBold),
                  Obx(
                    () => CupertinoSwitch(
                      activeColor: AppColor.primaryDark,
                      value: controller.isOnlyMyTicket.value,
                      onChanged: (value) => controller.isOnlyMyTicket.value = value,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              Text("기간", style: AppTypeFace.smallSemiBold),
              SizedBox(height: 12.h),
              Obx(
                () => Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: [
                    _FilterChip(
                      "일주일",
                      onTap: () {
                        controller.dateType.value = "week";
                      },
                      color: controller.dateType.value == "week" ? null : AppColor.grayE5,
                    ),
                    _FilterChip(
                      "한 달",
                      onTap: () {
                        controller.dateType.value = "month";
                      },
                      color: controller.dateType.value == "month" ? null : AppColor.grayE5,
                    ),
                    _FilterChip(
                      "6개월",
                      onTap: () {
                        controller.dateType.value = "6month";
                      },
                      color: controller.dateType.value == "6month" ? null : AppColor.grayE5,
                    ),
                    _FilterChip(
                      controller.dateType.value == "day"
                          ? "${DateFormat('yy.MM.dd').format(controller.rangeStart.value!)} ~ ${DateFormat('yy.MM.dd').format(controller.rangeEnd.value ?? DateTime.now())}"
                          : "직접 지정",
                      onTap: () async {
                        await showCalendar(context);

                        if (controller.rangeStart.value != null && controller.rangeEnd.value != null) {
                          controller.dateType.value = "day";
                        }
                      },
                      color: controller.dateType.value == "day" ? null : AppColor.grayE5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              Text("카테고리", style: AppTypeFace.smallSemiBold),
              SizedBox(height: 12.h),
              Obx(
                () => Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: [
                    for (CategoryType category in CategoryType.values)
                      _FilterChip(
                        category.name,
                        onTap: () {
                          if (controller.categoryList.contains(category.name)) {
                            controller.categoryList.remove(category.name);
                          } else {
                            controller.categoryList.add(category.name);
                          }
                        },
                        color: controller.categoryList.contains(category.name) ? null : AppColor.grayE5,
                        isCategory: true,
                      ),
                  ],
                ),
              ),
              const Spacer(),
              TicketsButton("검색하기", onTap: () async {
                Get.toNamed(RoutePath.ticketSearchResult);
                await controller.searchTicket();
              }, color: AppColor.primaryNormal),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterTitleTextField extends GetView<TicketSearchController> {
  const _FilterTitleTextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: SizedBox(
        height: 48.h,
        child: TextField(
          controller: controller.searchTextController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColor.grayF2,
            hintText: '티켓을 검색해보세요!',
            hintStyle: AppTypeFace.xsmallSemiBold.copyWith(color: AppColor.gray8E),
            prefixIconConstraints: BoxConstraints(minWidth: 60.w),
            prefixIcon: Icon(Icons.search, size: 24.w),
            prefixIconColor: Colors.black,
            contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 11.h),
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip(this.text, {this.color, required this.onTap, this.isCategory = false});

  final String text;
  final Color? color;
  final VoidCallback onTap;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: color ?? AppColor.primaryLight,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isCategory ? 16.w : 32.w, vertical: 4.h),
          child: Text(text, style: AppTypeFace.xsmallSemiBold),
        ),
      ),
    );
  }
}
