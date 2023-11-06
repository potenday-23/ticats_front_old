import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tickets/presentation/widget/tickets_button.dart';

import '../controller/register_controller.dart';
import 'widget/register_app_bar.dart';

class RequestPermissionPage extends StatelessWidget {
  const RequestPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegisterAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 56.h),
              Text(
                "티캣츠에서 나만의 티켓을 꾸미기 위해\n접근 권한 동의를 받고있어요.",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 36.h),
              SvgPicture.asset(
                'assets/icons/camera.svg',
                width: 60.w,
                height: 60.w,
              ),
              Text("카메라 / 사진첩", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: const Color(0xFF48484A))),
              SizedBox(height: 8.h),
              Text("티켓 이미지 등록 등 서비스 이용 시,\n사진 촬영과 이미지 등 콘텐츠 접근",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF636366),
                  )),
              const Spacer(),
              TicketsButton("다음", onTap: () async {
                bool result = await Get.find<RegisterController>().requestPhotoPermission();
              }),
              SizedBox(height: 86.h),
            ],
          ),
        ),
      ),
    );
  }
}
