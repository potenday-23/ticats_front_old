import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/service/auth_service.dart';
import 'package:tickets/presentation/main/controller/make_ticket_controller.dart';
import 'package:tickets/presentation/main/data/model/ticket_model.dart';

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
            backgroundColor: Colors.white,
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
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => Get.find<MakeTicketController>().isPrivate.value = !Get.find<MakeTicketController>().isPrivate.value,
                      child: Row(
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
                    ),
                    SizedBox(height: 6.h),
                    GetX<MakeTicketController>(builder: (controller) {
                      return GestureDetector(
                        onTap: () async {
                          await controller.uploadTicket();
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
                            child: controller.isUploading.value
                                ? const CircularProgressIndicator()
                                : Text("확인", style: AppTypeFace.smallBold.copyWith(color: Colors.white)),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: 50.w,
            top: -340.h,
            child: Align(alignment: Alignment.center, child: SvgPicture.asset('assets/cats/cat_enjoy.svg')),
          ),
        ],
      );
    },
  );
}

showReportDialog(BuildContext context, TicketModel ticket) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          AlertDialog(
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollable: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
            elevation: 0,
            content: Padding(
              padding: EdgeInsets.only(top: 36.h),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Text("티켓이 많이 불편하셨나요?\n해당 티켓을 신고하시겠어요?", style: AppTypeFace.smallBold, textAlign: TextAlign.center),
                    SizedBox(height: 36.h),
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => Get.back(),
                            child: Container(
                              height: 56.h,
                              decoration: BoxDecoration(
                                color: AppColor.grayE5,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(14.r),
                                ),
                              ),
                              child: Center(
                                child: Text("취소", style: AppTypeFace.smallSemiBold),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () async {
                              final Email emailBody = Email(
                                body:
                                    '신고 사유:\n\n\n-----------------\n신고자: ${AuthService.to.user!.member!.nickname}\n신고자 아이디: ${AuthService.to.user!.member!.id}\n신고 티켓: ${ticket.id}',
                                subject: '[티캣츠 티켓 신고]',
                                recipients: ['wonhee0619@gmail.com'],
                                isHTML: false,
                              );
                              await FlutterEmailSender.send(emailBody);
                            },
                            child: Container(
                              height: 56.h,
                              decoration: BoxDecoration(
                                color: AppColor.systemBlue,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(14.r),
                                ),
                              ),
                              child: Center(
                                child: Text("신고 메일 보내기", style: AppTypeFace.smallSemiBold.copyWith(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: 50.w,
            top: -210.h,
            child: Align(alignment: Alignment.centerLeft, child: SvgPicture.asset('assets/cats/cat_eyes.svg')),
          ),
        ],
      );
    },
  );
}

showLogoutDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
        scrollable: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
        elevation: 0,
        content: Padding(
          padding: EdgeInsets.only(top: 36.h),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Text("로그아웃 하시겠어요?", style: AppTypeFace.smallBold, textAlign: TextAlign.center),
                SizedBox(height: 36.h),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Get.back(),
                        child: Container(
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: AppColor.grayE5,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(14.r),
                            ),
                          ),
                          child: Center(
                            child: Text("취소", style: AppTypeFace.smallSemiBold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => AuthService.to.logout(),
                        child: Container(
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: AppColor.systemBlue,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(14.r),
                            ),
                          ),
                          child: Center(
                            child: Text("확인", style: AppTypeFace.smallSemiBold.copyWith(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
