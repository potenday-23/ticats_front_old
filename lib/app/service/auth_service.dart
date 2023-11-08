// ignore_for_file: library_prefixes

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/presentation/authentication/data/model/user_model.dart';
import 'package:tickets/presentation/authentication/data/model/user_oauth_model.dart';

import '../config/app_const.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final storage = const FlutterSecureStorage();

  UserModel? _user;
  UserOAuthModel? _userOAuth;

  UserModel? get user => _user;
  UserOAuthModel? get userOAuth => _userOAuth;

  @override
  void onInit() async {
    super.onInit();

    await getUser();
    if (_userOAuth != null) {
      await login();
    }
  }

  Future<void> getUser() async {
    String? savedUser = await storage.read(key: 'user');
    String? savedUserOauth = await storage.read(key: 'user_oauth');

    if (savedUser != null && savedUserOauth != null) {
      _user = UserModel.fromJson(jsonDecode(savedUser));
      _userOAuth = UserOAuthModel.fromJson(jsonDecode(savedUserOauth));
    }
  }

  Future<void> setUser(UserModel user) async {
    _user = user;
    await storage.write(key: 'user', value: jsonEncode(user.toJson()));
  }

  Future<void> setUserOAuth(UserOAuthModel userOAuthModel) async {
    await storage.write(key: 'user_oauth', value: jsonEncode(userOAuthModel.toJson()));
  }

  Future<void> login() async {
    // Check user is exist
    try {
      final response = await Dio().get(
        '${AppConst.apiUrl}/members',
        queryParameters: {
          'socialId': _userOAuth!.socialId,
          'socialType': _userOAuth!.socialType,
        },
      );
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          // User not exist, go to register
          print(e.response!.data);

          Get.toNamed(RoutePath.termAgree);
        } else {
          print(e.response!.data);
          print(e.response!.headers);
        }
      } else {
        print(e.requestOptions);
        print(e.message);
      }
      return;
    }

    // Login
    try {
      var response = await Dio().post(
        '${AppConst.apiUrl}/auth/login',
        options: Options(headers: {'Content-Type': 'multipart/form-data', 'Accept': '*/*'}),
        data: FormData.fromMap({
          'request': MultipartFile.fromString(
            jsonEncode({'socialType': "KAKAO", 'socialId': "test"}),
            contentType: MediaType('application', 'json'),
          ),
        }),
      );

      if (response.statusCode == 201) {
        _user = UserModel.fromJson(response.data);

        await setUser(_user!);
        await setUserOAuth(_userOAuth!);

        Get.offAllNamed(RoutePath.home);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'user');
    await storage.delete(key: 'user_oauth');

    _user = null;
    _userOAuth = null;
  }

  Future<void> loginWithKakao() async {
    User kakaoUser;

    try {
      kakaoUser = await UserApi.instance.me();
    } catch (error) {
      if (await isKakaoTalkInstalled()) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          print('카카오톡으로 로그인 성공');
        } catch (error) {
          print('카카오톡으로 로그인 실패 $error');

          // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
          if (error is PlatformException && error.code == 'CANCELED') {
            return null;
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

      try {
        kakaoUser = await UserApi.instance.me();
        print(kakaoUser.toString());
      } catch (error) {
        print('사용자 정보 요청 실패 $error');
        return null;
      }
    }

    _userOAuth = UserOAuthModel(socialId: kakaoUser.id.toString(), socialType: "KAKAO");
  }

  Future<void> loginWithApple() async {
    if (await TheAppleSignIn.isAvailable()) {
      final AuthorizationResult result = await TheAppleSignIn.performRequests([const AppleIdRequest(requestedScopes: [])]);

      switch (result.status) {
        case AuthorizationStatus.authorized:
          _userOAuth = UserOAuthModel(socialId: result.credential!.user!, socialType: "APPLE");

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
