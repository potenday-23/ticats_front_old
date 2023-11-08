import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_const.dart';
import 'package:tickets/presentation/home/data/model/ticket_model.dart';

class TicketController extends GetxController {
  RxList<TicketModel> ticketList = <TicketModel>[].obs;

  @override
  void onInit() async {
    super.onInit();

    await getTicket();
  }

  Future<void> getTicket() async {
    try {
      var response = await Dio().get('${AppConst.apiUrl}/tickets/total');

      if (response.statusCode == 200) {
        ticketList.assignAll(response.data.map<TicketModel>((e) => TicketModel.fromJson(e)).toList());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
