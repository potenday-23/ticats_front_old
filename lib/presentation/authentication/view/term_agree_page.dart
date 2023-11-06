import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/presentation/authentication/controller/register_controller.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

import 'term_detail_page.dart';

class TermAgreePage extends GetView<RegisterController> {
  const TermAgreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 56.h,
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            Text("원활한 서비스 이용을 위해\n약관에 동의해주세요.", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700)),
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
                                activeColor: const Color(0xFF007AFF),
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
                                activeColor: const Color(0xFF007AFF),
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
                          Text("[필수] 서비스 이용약관", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.termOfUse),
                      child: Text("보기", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8E8E93))),
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
                                activeColor: const Color(0xFF007AFF),
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
                          Text("[필수] 개인정보 처리방침 및 수집이용 동의", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.privacyPolicy),
                      child: Text("보기", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8E8E93))),
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
                                activeColor: const Color(0xFF007AFF),
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
                          Text("[선택] 서비스 알림 수신 동의", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.locationTermOfUse),
                      child: Text("보기", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8E8E93))),
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
                                activeColor: const Color(0xFF007AFF),
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
                          Text("[선택] 마케팅 정보 수신 및 이용 동의", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutePath.termDetail, arguments: TermType.marketingConsent),
                      child: Text("보기", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8E8E93))),
                    ),
                  ],
                ),
                SizedBox(height: 195.h),
                TicketsButton(
                  "다음",
                  color: controller.isRequiredAgree ? const Color(0xFF007AFF) : const Color(0xFFC7C7CC),
                  onTap: controller.isRequiredAgree ? () {} : null,
                ),
              ]);
            }),
          ],
        ),
      ),
    );
  }
}
