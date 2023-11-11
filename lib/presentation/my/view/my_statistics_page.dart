import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/main/view/widget/no_ticket_widget.dart';

import '../controller/my_page_controller.dart';

final List<Color> pieColors = [
  const Color(0xFFF683BB),
  const Color(0xFFF89CC9),
  const Color(0xFFFAB5D6),
  const Color(0xFFFBCDE4),
  const Color(0xFFC7C7CC),
  const Color(0xFFD9D9E1),
  const Color(0xFFE5E5EA),
  const Color(0xFFF7F2F2),
];

class MyStatisticsPage extends GetView<MyPageController> {
  const MyStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 56.w,
        leadingWidth: 80.w,
        leading: Row(
          children: [
            SizedBox(width: 24.w),
            GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset('assets/icons/arrow_left.svg', width: 24.w, height: 24.h),
            ),
          ],
        ),
        centerTitle: true,
        title: Text("통계 보기", style: AppTypeFace.smallBold),
      ),
      body: Obx(() {
        if (controller.isStatisticLoading.value) return const Center(child: CircularProgressIndicator());
        if (controller.statisticsList.isEmpty) return const Center(child: NoTicketWidget());

        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13.h),
                child: SizedBox(
                  width: 250.w,
                  height: 250.w,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                            controller.touchedIndex.value = -1;
                            return;
                          }
                          controller.touchedIndex.value = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 37.5.w,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1, color: AppColor.grayE5),
              SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 28.h),
                      Text("이번 달엔 ${controller.statisticsList[0].category}를 가장 많이 봤어요", style: AppTypeFace.smallSemiBold),
                      SizedBox(height: 18.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: AppColor.grayF2,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Column(children: [
                            for (int i = 0; i < controller.statisticsList.length; i++)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                                child: Row(
                                  children: [
                                    Text(controller.statisticsList[i].category, style: AppTypeFace.smallSemiBold),
                                    const Spacer(),
                                    Text('${controller.statisticsList[i].categoryCnt}회', style: AppTypeFace.smallSemiBold),
                                  ],
                                ),
                              )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 65.h),
            ],
          ),
        );
      }),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(controller.statisticsList.length, (i) {
      final isTouched = i == controller.touchedIndex.value;
      final radius = isTouched ? 100.w : 87.5.w;

      return PieChartSectionData(
        color: pieColors[i],
        value: controller.statisticsList[i].categoryPercent,
        title: controller.statisticsList[i].categoryPercent < 10
            ? '${controller.statisticsList[i].categoryPercent}%'
            : '${controller.statisticsList[i].categoryPercent}%\n${controller.statisticsList[i].category}',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      );
    });
  }
}
