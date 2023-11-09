import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/main/controller/make_ticket_controller.dart';

showTicketsDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          AlertDialog(
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollable: true,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
            elevation: 0,
            content: Padding(
              padding: EdgeInsets.only(top: 36.h),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Text("짜잔~\n티켓을 완성했어요!", style: AppTypeFace.smallBold, textAlign: TextAlign.center),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(11.w),
                          child: SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: Obx(
                              () => Checkbox(
                                activeColor: AppColor.systemBlue,
                                value: Get.find<MakeTicketController>().isPrivate.value,
                                onChanged: (value) => Get.find<MakeTicketController>().isPrivate.value = value!,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 24.w),
                          child: Text("나만 보기", style: AppTypeFace.smallSemiBold),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    GestureDetector(
                      onTap: () async {
                        await Get.find<MakeTicketController>().uploadTicket();
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: AppColor.primaryDark,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(14.r),
                            bottomRight: Radius.circular(14.r),
                          ),
                        ),
                        child: Center(
                          child: Text("확인", style: AppTypeFace.smallBold.copyWith(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: 50.w,
            top: -320.h,
            child: Align(alignment: Alignment.center, child: SvgPicture.asset('assets/cats/cat_enjoy.svg')),
          ),
        ],
      );
    },
  );
}
