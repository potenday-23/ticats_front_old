import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tickets/app/service/auth_service.dart';

import '../data/model/user_model.dart';

class RegisterController extends GetxController {
  @override
  void onClose() {
    nicknameController.dispose();
    super.onClose();
  }

  // Gallery Permission
  Future<bool> requestGalleryPermission() async {
    await Permission.photos.request();

    return await Permission.photos.isGranted;
  }

  // Term
  bool get isAllAgree => isAgree1.value && isAgree2.value && isAgree3.value && isAgree4.value;
  bool get isRequiredAgree => isAgree1.value && isAgree2.value;

  RxBool isAgree1 = false.obs;
  RxBool isAgree2 = false.obs;
  RxBool isAgree3 = false.obs;
  RxBool isAgree4 = false.obs;

  void setAllAgree() {
    if (!isAllAgree) {
      isAgree1.value = true;
      isAgree2.value = true;
      isAgree3.value = true;
      isAgree4.value = true;
    } else {
      isAgree1.value = false;
      isAgree2.value = false;
      isAgree3.value = false;
      isAgree4.value = false;
    }
  }

  // Profile
  final TextEditingController nicknameController = TextEditingController();
  Rx<XFile?> profileImage = XFile("").obs;

  RxString nickNameErrorText = "".obs;
  RxInt nickNameLength = 0.obs;

  bool get hasNickError => nickNameErrorText.value.isNotEmpty;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();

    profileImage.value = await picker.pickImage(source: ImageSource.gallery);
  }

  // Register
  Future<void> registerNewUser() async {
    try {
      var data = FormData.fromMap({
        'request': MultipartFile.fromString(
          jsonEncode({
            'nickname': nicknameController.text,
            'socialId': AuthService.to.userOAuth!.socialId,
            'socialType': AuthService.to.userOAuth!.socialType,
            'pushAgree': isAgree3.value ? "AGREE" : "DISAGREE",
            'marketingAgree': isAgree4.value ? "AGREE" : "DISAGREE",
          }),
          contentType: MediaType('application', 'json'),
        ),
        'categorys': MultipartFile.fromString(
          '["뮤지컬", "드라마"]',
          contentType: MediaType('application', 'json'),
        ),
      });

      if (profileImage.value!.path.isNotEmpty) {
        data.files.add(MapEntry(
          'profileImage',
          await MultipartFile.fromFile(profileImage.value!.path, filename: profileImage.value!.name),
        ));
      }

      var response = await Dio().post(
        'http://13.124.32.19:8080/api/auth/login',
        options: Options(
          headers: {'Content-Type': 'multipart/form-data', 'Accept': '*/*'},
        ),
        data: data,
      );

      if (response.statusCode == 201) {
        await AuthService.to.setUser(UserModel.fromJson(response.data));
        await AuthService.to.setUserOAuth(AuthService.to.userOAuth!);

        Get.snackbar("성공!", "회원가입 성공");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
      Get.snackbar("에러!", "회원가입에 실패하였습니다.\n관리자에게 문의해주세요.");
    }
  }
}
