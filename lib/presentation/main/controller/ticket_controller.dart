// ignore_for_file: unnecessary_cast

import 'package:get/get.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';
import 'package:tickets/app/service/auth_service.dart';

import '../data/model/ticket_model.dart';

class TicketController extends GetxController {
  // Ticket
  RxList<TicketModel> ticketList = <TicketModel>[].obs;
  RxList<TicketModel> myTicketList = <TicketModel>[].obs;
  RxList<TicketModel> likeTicketList = <TicketModel>[].obs;
  RxList<int> likeTicketIdList = <int>[].obs;

  RxBool isTicketLoading = false.obs;
  RxBool isMyTicketLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();

    await getTicket();
    await getLike();
    await getMyTicket();
  }

  Future<void> getTicket() async {
    isTicketLoading.value = true;

    try {
      var response = await TicketsDio().get('/tickets/total');

      if (response.statusCode == 200) {
        ticketList.assignAll(response.data.map<TicketModel>((e) => TicketModel.fromJson(e)).toList());
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      isTicketLoading.value = false;
    }
  }

  Future<void> getMyTicket() async {
    if (AuthService.to.user?.token?.accessToken == null) return;

    isMyTicketLoading.value = true;

    try {
      var response = await TicketsDio().get('/tickets/my');

      if (response.statusCode == 200) {
        myTicketList.assignAll(response.data.map<TicketModel>((e) => TicketModel.fromJson(e)).toList());
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      isMyTicketLoading.value = false;
    }
  }

  Future<void> getLike() async {
    if (AuthService.to.user?.token?.accessToken == null) return;

    try {
      var response = await TicketsDio().get('/likes');

      if (response.statusCode == 200) {
        likeTicketList.assignAll(response.data.map<TicketModel>((e) => TicketModel.fromJson(e)).toList());
        likeTicketIdList.assignAll(response.data.map<int>((e) => TicketModel.fromJson(e).id!).toList());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
