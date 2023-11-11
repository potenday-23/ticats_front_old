// ignore_for_file: unnecessary_cast

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';

import '../data/model/ticket_model.dart';

class TicketSearchController extends GetxController {
  RxList<TicketModel> searchResultList = <TicketModel>[].obs;

  // Filter
  final TextEditingController searchTextController = TextEditingController();

  RxBool isOnlyMyTicket = true.obs;

  RxList<String> categoryList = <String>[].obs;

  RxString dateType = "week".obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime?> rangeStart = (null as DateTime?).obs;
  Rx<DateTime?> rangeEnd = (null as DateTime?).obs;
  RxBool isTodayInRange = false.obs;

  RxBool isLoading = false.obs;

  Future<void> searchTicket() async {
    try {
      isLoading.value = true;

      final Map<String, dynamic> parameter = {};

      if (searchTextController.text.isNotEmpty) {
        parameter['search'] = searchTextController.text;
      }

      if (categoryList.isNotEmpty) {
        parameter['categorys'] = categoryList.join(',');
      }

      if (dateType.value == "day") {
        parameter['start'] = DateFormat("yyyy-MM-dd").format(rangeStart.value!);
        parameter['end'] = DateFormat("yyyy-MM-dd").format(rangeEnd.value!);
      } else {
        parameter['period'] = dateType.value;
      }

      final response = await TicketsDio().get(
        isOnlyMyTicket.value ? '/tickets/my' : '/tickets/total',
        queryParameters: parameter,
      );

      if (response.statusCode == 200) {
        searchResultList.assignAll(response.data.map<TicketModel>((e) => TicketModel.fromJson(e)).toList());
      }
    } on DioException catch (e) {
      print(e.message);
    } finally {
      isLoading.value = false;
    }
  }
}
