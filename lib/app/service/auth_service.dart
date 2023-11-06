// ignore_for_file: library_prefixes

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:the_apple_sign_in/scope.dart' as AppleScope;

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  Future<void> loginWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }

    User user;

    try {
      user = await UserApi.instance.me();
      print(user.toString());
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
      return;
    }
  }

  Future<void> loginWithApple() async {
    if (await TheAppleSignIn.isAvailable()) {
      final AuthorizationResult result = await TheAppleSignIn.performRequests([
        const AppleIdRequest(requestedScopes: [AppleScope.Scope.email])
      ]);

      switch (result.status) {
        case AuthorizationStatus.authorized:
          print(result.credential!.user);
          break;
        case AuthorizationStatus.error:
          print('애플 로그인 오류 : ${result.error!.localizedDescription}');
          break;
        case AuthorizationStatus.cancelled:
          print("취소!!!");
          break;
      }
    } else {
      print('애플 로그인을 지원하지 않는 기기입니다.');
    }
  }
}
