import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

import '../controller/register_controller.dart';
import 'term_detail_page.dart';
import 'widget/register_app_bar.dart';

class TermAgreePage extends GetView<RegisterController> {
  const TermAgreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            Text("원활한 서비스 이용을 위해\n약관에 동의해주세요.", style: AppTypeFace.smallBold),
            SizedBox(height: 26.h),
            Obx(() {
              return Column(children: [
                GestureDetector(
                  onTap: () => controller.setAllAgree(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.w),
                            child: SizedBox(
                              width: 18.w,
                              height: 18.w,
                              child: Checkbox(
                                activeColor: AppColor.systemBlue,
                                value: controller.isAllAgree,
                                onChanged: (value) {
                                  controller.setAllAgree();
                                },
                                splashRadius: 0.0,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text("모두 동의합니다.", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(height: 1.h, color: const Color(0xFFE5E5EA)),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.isAgree1.value = !controller.isAgree1.value,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.w),
                            child: SizedBox(
                              width: 18.w,
                              height: 18.w,
                              child: Checkbox(
                                activeColor: AppColor.systemBlue,
                                value: controller.isAgree1.value,
                                onChanged: (value) {
                                  controller.isAgree1.value = !controller.isAgree1.value;
                                },
                                splashRadius: 0.0,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text("[필수] 서비스 이용약관", style: AppTypeFace.xsmallMedium),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.termOfUse),
                      child: Text("보기", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.gray8E)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.isAgree2.value = !controller.isAgree2.value,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.w),
                            child: SizedBox(
                              width: 18.w,
                              height: 18.w,
                              child: Checkbox(
                                activeColor: AppColor.systemBlue,
                                value: controller.isAgree2.value,
                                onChanged: (value) {
                                  controller.isAgree2.value = !controller.isAgree2.value;
                                },
                                splashRadius: 0.0,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text("[필수] 개인정보 처리방침 및 수집이용 동의", style: AppTypeFace.xsmallMedium),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.privacyPolicy),
                      child: Text("보기", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.gray8E)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.isAgree3.value = !controller.isAgree3.value,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.w),
                            child: SizedBox(
                              width: 18.w,
                              height: 18.w,
                              child: Checkbox(
                                activeColor: AppColor.systemBlue,
                                value: controller.isAgree3.value,
                                onChanged: (value) {
                                  controller.isAgree3.value = !controller.isAgree3.value;
                                },
                                splashRadius: 0.0,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text("[선택] 서비스 알림 수신 동의", style: AppTypeFace.xsmallMedium),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.servicePushAgree),
                      child: Text("보기", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.gray8E)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.isAgree4.value = !controller.isAgree4.value,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.w),
                            child: SizedBox(
                              width: 18.w,
                              height: 18.w,
                              child: Checkbox(
                                activeColor: AppColor.systemBlue,
                                value: controller.isAgree4.value,
                                onChanged: (value) {
                                  controller.isAgree4.value = !controller.isAgree4.value;
                                },
                                splashRadius: 0.0,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text("[선택] 마케팅 정보 수신 및 이용 동의", style: AppTypeFace.xsmallMedium),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.marketingConsent),
                      child: Text("보기", style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.gray8E)),
                    ),
                  ],
                ),
              ]);
            }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 56.h),
        child: Obx(
          () => TicketsButton(
            "다음",
            color: controller.isRequiredAgree ? AppColor.systemBlue : AppColor.grayC7,
            onTap: controller.isRequiredAgree ? () => Get.toNamed(RoutePath.requestPermssion) : null,
          ),
        ),
      ),
    );
  }
}
