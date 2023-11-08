import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';

import '../controller/home_controller.dart';
import 'widget/tickets_card_view.dart';
import 'widget/tickets_grid_view.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SvgPicture.asset('assets/icons/ticats_logo.svg', width: 42.w, height: 42.w),
        ),
        title: TabBar(
          // Misc
          controller: controller.tabController,
          tabs: controller.tabs,
          isScrollable: true,
          padding: EdgeInsets.zero,

          // label Decoration
          labelColor: Colors.black,
          labelStyle: AppTypeFace.smallBold,

          // unselectedLabel Decoration
          unselectedLabelColor: AppColor.gray8E,
          unselectedLabelStyle: AppTypeFace.smallBold,

          // divider & indicator Decoration
          dividerColor: Colors.transparent,
          indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 2)),
          indicatorPadding: EdgeInsets.symmetric(horizontal: -8.w),
          indicatorColor: Colors.transparent,

          splashFactory: NoSplash.splashFactory,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/filter.svg', width: 24.w, height: 24.w)),
          ),
        ],
      ),
      body: Obx(
        () => TabBarView(
          controller: controller.tabController,
          children: [
            controller.allViewIndex == 0 ? TicketsCardView(isAllTicket: true) : TicketsGridView(isAllTicket: true),
            controller.myViewIndex == 0 ? TicketsCardView() : TicketsGridView(),
          ],
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(highlightColor: AppColor.primaryNormal.withOpacity(0.3)),
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          splashColor: AppColor.primaryNormal.withOpacity(0.5),
          onPressed: () {
            if (controller.tabIndex.value == 0) {
              controller.allViewIndex == 0 ? controller.allViewIndex.value = 1 : controller.allViewIndex.value = 0;
            } else {
              controller.myViewIndex == 0 ? controller.myViewIndex.value = 1 : controller.myViewIndex.value = 0;
            }
          },
          child: Obx(
            () => controller.tabIndex.value == 0
                ? controller.allViewIndex.value == 0
                    ? SvgPicture.asset('assets/icons/grid_view.svg')
                    : SvgPicture.asset('assets/icons/card_view.svg')
                : controller.myViewIndex.value == 0
                    ? SvgPicture.asset('assets/icons/grid_view.svg')
                    : SvgPicture.asset('assets/icons/card_view.svg'),
          ),
        ),
      ),
    );
  }
}
