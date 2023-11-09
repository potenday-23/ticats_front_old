import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/main/controller/main_controller.dart';
import 'package:tickets/presentation/main/controller/make_ticket_controller.dart';

class TicketsBottomNavBar extends GetView<MainController> {
  const TicketsBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return SizedBox(
            height: 66.h,
            child: Column(
              children: [
                const Divider(height: 1, color: Color(0xFFE5E5EA)),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => controller.changeIndex(0),
                        child: Column(children: [
                          SizedBox(height: 8.h),
                          SvgPicture.asset(
                            controller.selectedIndex == 0 ? 'assets/icons/home_active.svg' : 'assets/icons/home.svg',
                            width: 24.w,
                            height: 24.w,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "홈",
                            style: AppTypeFace.xsmallBold.copyWith(
                              color: controller.selectedIndex == 0 ? const Color(0xFFF16AAB) : const Color(0xFF636366),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          controller.changeIndex(1);
                          Get.find<MakeTicketController>().currentIndex.value = 0;
                        },
                        child: Column(children: [
                          SizedBox(height: 8.h),
                          SvgPicture.asset(
                            controller.selectedIndex == 1 ? 'assets/icons/ticket_active.svg' : 'assets/icons/ticket.svg',
                            width: 24.w,
                            height: 24.w,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "티켓 만들기",
                            style: AppTypeFace.xsmallBold.copyWith(
                              color: controller.selectedIndex == 1 ? const Color(0xFFF16AAB) : const Color(0xFF636366),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => controller.changeIndex(2),
                        child: Column(children: [
                          SizedBox(height: 8.h),
                          SvgPicture.asset(
                            controller.selectedIndex == 2 ? 'assets/icons/person_active.svg' : 'assets/icons/person.svg',
                            width: 24.w,
                            height: 24.w,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "마이페이지",
                            style: AppTypeFace.xsmallBold.copyWith(
                              color: controller.selectedIndex == 2 ? const Color(0xFFF16AAB) : const Color(0xFF636366),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
