import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tickets/app/config/app_const.dart';
import 'package:tickets/app/service/auth_service.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectNetworkProvider();
    injectService();
  }

  void injectNetworkProvider() {
    Get.lazyPut(() => (DioBuilder(options: BaseOptions(baseUrl: AppConst.apiUrl))), fenix: true);
  }

  void injectService() {
    Get.put<AuthService>(AuthService());
  }
}
