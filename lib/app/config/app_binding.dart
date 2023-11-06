import 'package:get/get.dart';
import 'package:tickets/app/service/auth_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectService();
  }

  void injectService() {
    Get.put<AuthService>(AuthService());
  }
}
