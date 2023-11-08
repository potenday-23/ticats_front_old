import 'package:dio/dio.dart';
import 'package:tickets/app/service/auth_service.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (AuthService.to.user?.token?.accessToken != null) options.headers['Authorization'] = AuthService.to.user?.token?.accessToken;

    handler.next(options);
  }
}
