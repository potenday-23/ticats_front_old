import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tickets/app/config/app_color.dart';

import '../../controller/ticket_search_controller.dart';

Future<void> showCalendar(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
          contentPadding: EdgeInsets.all(15.w),
          backgroundColor: Colors.white,
          scrollable: true,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          elevation: 0,
          content: Container(
            width: Get.width - 100,
            height: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _CalendarWidget(),
                SizedBox(height: 20.h),
                const _FromToWidget(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class _CalendarWidget extends GetView<TicketSearchController> {
  const _CalendarWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TableCalendar(
        calendarFormat: CalendarFormat.month,
        rangeSelectionMode: RangeSelectionMode.enforced,
        rowHeight: 41.h,

        focusedDay: controller.focusedDay.value,
        firstDay: DateTime(2010, 1, 1),
        lastDay: DateTime.now(),
        rangeStartDay: controller.rangeStart.value,
        rangeEndDay: controller.rangeEnd.value,

        // Header
        headerStyle: HeaderStyle(
          headerPadding: EdgeInsets.only(bottom: 0.h),
          formatButtonVisible: false,

          // Title
          titleCentered: true,
          titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: const Color(0xFF404244)),

          // Chevron
          leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.black),
          leftChevronPadding: EdgeInsets.zero,
          rightChevronPadding: EdgeInsets.zero,
        ),

        // Days of Week
        daysOfWeekHeight: 48.h,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: const Color(0xFF9B9EA5),
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
          weekendStyle: TextStyle(
            color: const Color(0xFF9B9EA5),
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),

        // Calendar
        calendarBuilders: CalendarBuilders(
          rangeHighlightBuilder: (context, day, isWithinRange) {
            if (isWithinRange) {
              return LayoutBuilder(builder: (context, constraints) {
                final isRangeStart = isSameDay(day, controller.rangeStart.value);
                final isRangeEnd = isSameDay(day, controller.rangeEnd.value);

                final isSat = day.weekday == 6;
                final isSun = day.weekday == 7;

                return Center(
                  child: Container(
                    height: (constraints.maxHeight - 6.h),
                    margin: EdgeInsetsDirectional.only(
                      start: isRangeStart ? constraints.maxWidth * 0.5 : 0.0,
                      end: isRangeEnd ? constraints.maxWidth * 0.5 : 0.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.primaryLight.withOpacity(0.3),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: isSun ? const Radius.circular(16) : Radius.zero,
                        bottomLeft: isSun ? const Radius.circular(16) : Radius.zero,
                        topRight: isSat ? const Radius.circular(16) : Radius.zero,
                        bottomRight: isSat ? const Radius.circular(16) : Radius.zero,
                      ),
                    ),
                  ),
                );
              });
            }
            return null;
          },
        ),
        calendarStyle: CalendarStyle(
          cellMargin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),

          // TextStyle
          defaultTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF5C5F64)),
          outsideTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFFDBDBDB)),
          weekendTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF5C5F64)),
          rangeStartTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
          rangeEndTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
          withinRangeTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColor.primaryNormal),
          todayTextStyle: controller.isTodayInRange.value
              ? TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColor.primaryNormal)
              : TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF5C5F64)),

          // Decoration
          rangeStartDecoration: BoxDecoration(
            color: AppColor.primaryLight,
            borderRadius: BorderRadius.circular(16),
          ),
          rangeEndDecoration: BoxDecoration(
            color: AppColor.primaryLight,
            borderRadius: BorderRadius.circular(16),
          ),

          // Avoid rendering error
          // Reference: https://github.com/aleksanderwozniak/table_calendar/issues/583
          defaultDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          disabledDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          holidayDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          markerDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          outsideDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          rowDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          todayDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          selectedDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          weekendDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          withinRangeDecoration: const BoxDecoration(shape: BoxShape.rectangle),
        ),

        // Event
        onRangeSelected: (start, end, focusedDay) {
          controller.rangeStart.value = start;
          controller.rangeEnd.value = end;

          if (controller.rangeStart.value != null && controller.rangeEnd.value != null) {
            controller.isTodayInRange.value =
                controller.rangeStart.value!.isBefore(DateTime.now()) && controller.rangeEnd.value!.isAfter(DateTime.now());
          } else {
            controller.isTodayInRange.value = false;
          }
        },
        onPageChanged: (focusedDay) => controller.focusedDay.value = focusedDay,
      );
    });
  }
}

class _FromToWidget extends GetView<TicketSearchController> {
  const _FromToWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "부터",
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF9B9EA5)),
                ),
                SizedBox(height: 5.67.h),
                if (controller.rangeStart.value != null) ...[
                  Text(
                    DateFormat('yy년 MM월 dd일').format(controller.rangeStart.value!),
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ] else ...[
                  Text('', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                ],
              ],
            ),
          ),
          Text("/", style: TextStyle(fontSize: 14.sp, color: const Color(0xFF9B9EA5))),
          Expanded(
            child: Column(
              children: [
                Text(
                  "까지",
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: const Color(0xFF9B9EA5)),
                ),
                SizedBox(height: 5.67.h),
                if (controller.rangeEnd.value != null) ...[
                  Text(
                    DateFormat('yy년 MM월 dd일').format(controller.rangeEnd.value!),
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ] else ...[
                  Text('', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                ],
              ],
            ),
          ),
        ],
      );
    });
  }
}
