import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/presentation/authentication/controller/register_controller.dart';
import 'package:tickets/presentation/authentication/view/widget/register_app_bar.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

class RegisterProfilePage extends StatelessWidget {
  const RegisterProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 36.h),
              Text("사용하실 닉네임과 사진을 추가해주세요.", style: AppTypeFace.smallBold),
              SizedBox(height: 42.h),
              GetX<RegisterController>(
                builder: (controller) {
                  return Stack(
                    children: [
                      if (controller.profileImage.value!.path.isNotEmpty) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60.w),
                          child: Image.asset(controller.profileImage.value!.path, width: 120.w, height: 120.w, fit: BoxFit.cover),
                        )
                      ] else ...[
                        SvgPicture.asset('assets/icons/user.svg', width: 120.w, height: 120.w)
                      ],
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
                  );
                },
              ),
              SizedBox(height: 24.h),
              const _NickNameTextField(),
              const Spacer(),
              GetX<RegisterController>(
                builder: (controller) => TicketsButton(
                  "티캣츠 시작하기",
                  onTap: controller.nickNameLength.value >= 2 && !controller.hasNickError
                      ? () async => await controller.registerNewUser()
                      : null,
                  color: controller.nickNameLength.value >= 2 && !controller.hasNickError ? null : AppColor.grayC7,
                ),
              ),
              SizedBox(height: 86.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _NickNameTextField extends GetView<RegisterController> {
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
