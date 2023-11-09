import 'package:get/get.dart';

import 'home_controller.dart';
import 'main_controller.dart';
import 'make_ticket_controller.dart';
import 'ticket_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MakeTicketController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => TicketController());
  }
}
