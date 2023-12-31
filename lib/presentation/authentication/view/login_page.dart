import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tickets/app/config/app_color.dart';
import 'package:tickets/app/config/app_typeface.dart';
import 'package:tickets/app/service/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 91.h),
            Center(
              child: SvgPicture.asset('assets/cats/cat_lick.svg', width: 114.57.w, height: 185.h),
            ),
            SizedBox(height: 45.h),
            Text(
              "티캣츠에 오신 것을\n환영합니다!",
              style: AppTypeFace.mediumBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              "나만의 문화생활 티켓을 꾸며보세요",
              style: AppTypeFace.smallSemiBold.copyWith(color: AppColor.gray8E),
            ),
            SizedBox(height: 50.h),
            _SSOButtonWidget(
              onTap: () async {
                await AuthService.to.loginWithKakao();
                await AuthService.to.login();
              },
              "카카오로 시작하기",
              color: const Color(0xFFFFE300),
              icon: "kakao.svg",
            ),
            SizedBox(height: 16.h),
            if (Platform.isIOS) ...[
              _SSOButtonWidget(
                onTap: () async {
                  await AuthService.to.loginWithApple();
                  await AuthService.to.login();
                },
                "APPLE로 시작하기",
                color: Colors.black,
                textColor: Colors.white,
                icon: "apple.svg",
              ),
              SizedBox(height: 16.h),
            ],
            _SSOButtonWidget(
              "로그인 없이 둘러보기",
              onTap: () => Fluttertoast.showToast(msg: "해당 기능은 준비 중이에요."),
              color: AppColor.grayC7,
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
              Text(text, style: AppTypeFace.smallBold.copyWith(color: textColor ?? Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
