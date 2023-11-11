import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';
import 'package:tickets/app/service/auth_service.dart';
import 'package:tickets/presentation/authentication/data/model/user_model.dart';
import 'package:tickets/presentation/my/data/model/statistics_model.dart';

class MyPageController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    nicknameController.text = AuthService.to.user!.member!.nickname!;
    nickNameLength.value = nicknameController.text.length;
    categoryList.assignAll(AuthService.to.user!.member!.categorys!);

    await getStatistics();
  }

  // Profile
  Rx<XFile?> profileImage = XFile("").obs;

  final TextEditingController nicknameController = TextEditingController();

  RxString nickNameErrorText = "".obs;
  RxInt nickNameLength = 0.obs;

  bool get hasNickError => nickNameErrorText.value.isNotEmpty;

  RxList<String> categoryList = <String>[].obs;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();

    profileImage.value = await picker.pickImage(source: ImageSource.gallery);
  }

  Future<void> patchProfile() async {
    try {
      var data = FormData.fromMap({
        'categorys': MultipartFile.fromString(
          jsonEncode(categoryList),
          contentType: MediaType('application', 'json'),
        ),
      });

      if (nicknameController.text.isNotEmpty && nicknameController.text != AuthService.to.user!.member!.nickname!) {
        data.files.add(MapEntry(
          'request',
          MultipartFile.fromString(
            jsonEncode({
              'nickname': nicknameController.text,
            }),
            contentType: MediaType('application', 'json'),
          ),
        ));
      } else {
        data.files.add(MapEntry(
          'request',
          MultipartFile.fromString(
            '{}',
            contentType: MediaType('application', 'json'),
          ),
        ));
      }

      if (profileImage.value != null && profileImage.value!.path.isNotEmpty) {
        data.files.add(MapEntry(
          'profileImage',
          await MultipartFile.fromFile(profileImage.value!.path, filename: profileImage.value!.name),
        ));
      }

      var response = await TicketsDio().patch(
        '/members',
        options: Options(
          headers: {'Content-Type': 'multipart/form-data', 'Accept': '*/*'},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        AuthService.to.setUser(AuthService.to.user!.copyWith(member: Member.fromJson(response.data)));
        Fluttertoast.showToast(msg: "프로필이 수정되었습니다.");
      } else {
        nickNameErrorText.value = response.data['message'];
      }
    } on DioException catch (e) {
      print(e.error);
      print(e.response!.data);
      Fluttertoast.showToast(msg: "프로필 수정 중 문제가 발생하였습니다.");
    }
  }

  // Resign
  RxBool isResignAgree = false.obs;
  RxList<int> resignReasonList = <int>[].obs;

  Future<void> postResign() async {
    try {
      var data = FormData.fromMap({
        'quits': MultipartFile.fromString(
          jsonEncode(resignReasonList),
          contentType: MediaType('application', 'json'),
        ),
      });

      var response = await TicketsDio().post(
        '/quits/reasons',
        options: Options(
          headers: {'Content-Type': 'multipart/form-data', 'Accept': '*/*'},
        ),
        data: data,
      );

      print(response.data);

      if (response.statusCode == 200) {
        AuthService.to.logout();
        Fluttertoast.showToast(msg: "회원 탈퇴가 완료되었습니다 ㅜ.ㅜ");
      }
    } on DioException catch (e) {
      print(e.error);
      print(e.response!.data);
      Fluttertoast.showToast(msg: "회원 탈퇴 중 문제가 발생하였습니다.");
    }
  }

  // Statistics
  RxList<StatisticsModel> statisticsList = <StatisticsModel>[].obs;
  RxInt touchedIndex = (-1).obs;
  RxBool isStatisticLoading = true.obs;

  Future<void> getStatistics() async {
    var response = await TicketsDio().get('/members/statistics');

    if (response.statusCode == 200) {
      statisticsList.assignAll(response.data.map<StatisticsModel>((e) => StatisticsModel.fromJson(e)).toList());
    }

    isStatisticLoading.value = false;
  }
}
