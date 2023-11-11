import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/app/service/auth_service.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

import '../controller/my_page_controller.dart';

class EditMyProfilePage extends GetView<MyPageController> {
  const EditMyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
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
        title: Text("프로필 수정", style: AppTypeFace.smallBold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 42.h),
            GestureDetector(
              onTap: () async => await controller.getImage(),
              child: Stack(
                children: [
                  Obx(() {
                    if (controller.profileImage.value!.path.isNotEmpty) {
                      return SizedBox(
                        width: 120.w,
                        height: 120.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(120.r),
                          child: Image.asset(controller.profileImage.value!.path, fit: BoxFit.cover),
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: 120.w,
                        height: 120.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(120.r),
                          child: CachedNetworkImage(imageUrl: AuthService.to.user!.member!.profileUrl!, fit: BoxFit.cover),
                        ),
                      );
                    }
                  }),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: GestureDetector(
                            onTap: () async => await controller.getImage(),
                            child: SvgPicture.asset('assets/icons/camera.svg', width: 32.w, height: 32.w)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            const _NickNameTextField(),
            SizedBox(height: 29.h),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Get.toNamed(RoutePath.changeCategory),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 13.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("관심 카테고리 선택", style: AppTypeFace.smallBold),
                    Icon(Icons.arrow_forward_ios, size: 20.w, color: AppColor.gray98),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: TicketsButton("저장하기", onTap: () async => await controller.patchProfile()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NickNameTextField extends GetView<MyPageController> {
  const _NickNameTextField();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            TextField(
              controller: controller.nicknameController,
              decoration: InputDecoration(
                border:
                    UnderlineInputBorder(borderSide: BorderSide(color: controller.hasNickError ? AppColor.systemError : AppColor.gray63)),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide(color: controller.hasNickError ? AppColor.systemError : AppColor.gray63)),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide(color: controller.hasNickError ? AppColor.systemError : AppColor.gray63)),
                hintText: "티케팅하는 고양이",
                hintStyle: AppTypeFace.smallSemiBold.copyWith(color: AppColor.gray8E),
              ),
              onChanged: (value) {
                controller.nickNameLength.value = value.length;

                if (value.length > 10) {
                  controller.nickNameErrorText.value = "10자 이하로 입력해주세요.";
                } else {
                  controller.nickNameErrorText.value = "";
                }
              },
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.nickNameErrorText.value, style: AppTypeFace.xsmallMedium.copyWith(color: AppColor.systemError)),
                Text("${controller.nickNameLength.value}/10",
                    style: AppTypeFace.xsmallMedium.copyWith(
                      color: controller.hasNickError ? AppColor.systemError : AppColor.gray8E,
                    )),
              ],
            ),
          ],
        );
      },
    );
  }
}
