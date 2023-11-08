import 'package:get/get.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';
import 'package:tickets/app/service/auth_service.dart';

import '../data/model/ticket_model.dart';

class TicketController extends GetxController {
  RxList<TicketModel> ticketList = <TicketModel>[].obs;
  RxList<TicketModel> myTicketList = <TicketModel>[].obs;

  RxBool isTicketLoading = false.obs;
  RxBool isMyTicketLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();

    await getTicket();
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
        ticketList.assignAll(response.data.map<TicketModel>((e) => TicketModel.fromJson(e)).toList());
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      isMyTicketLoading.value = false;
    }
  }
}
