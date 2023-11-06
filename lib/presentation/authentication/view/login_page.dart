import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/app/service/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 59.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                height: 250.h,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "티켓츠에 오신 것을\n환영합니다!",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              "나만의 문화생활 티켓을 꾸며보세요",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: const Color(0xFF8E8E93)),
            ),
            SizedBox(height: 50.h),
            _SSOButtonWidget(
              onTap: () async {
                User? user = await AuthService.to.loginWithKakao();
                if (user != null) {
                  Get.toNamed(RoutePath.termAgree);
                }
              },
              "카카오로 시작하기",
              color: const Color(0xFFFFE300),
              icon: "kakao.svg",
            ),
            SizedBox(height: 16.h),
            _SSOButtonWidget(
              onTap: () async => await AuthService.to.loginWithApple(),
              "애플로 시작하기",
              color: Colors.black,
              textColor: Colors.white,
              icon: "apple.svg",
            ),
            SizedBox(height: 16.h),
            _SSOButtonWidget(
              "로그인 없이 둘러보기",
              onTap: () {},
              color: const Color(0xFFC7C7CC),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _SSOButtonWidget extends StatelessWidget {
  const _SSOButtonWidget(this.text, {required this.onTap, required this.color, this.textColor, this.icon});

  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color? textColor;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.maxFinite,
          height: 56.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) SvgPicture.asset("assets/icons/$icon"),
              Text(text, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: textColor ?? Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}