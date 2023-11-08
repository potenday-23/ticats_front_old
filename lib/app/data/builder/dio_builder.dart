import 'package:dio/dio.dart';
import 'package:tickets/app/config/app_const.dart';

import '../interceptor/header_interceptor.dart';

class TicketsDio extends DioBuilder {
  TicketsDio() : super(options: BaseOptions(baseUrl: AppConst.apiUrl));

  static TicketsDio dio = TicketsDio();
}

class DioBuilder extends DioMixin implements Dio {
  final String contentType = 'application/json';
  final Duration connectionTimeOutMls = const Duration(milliseconds: 10000);
  final Duration readTimeOutMls = const Duration(milliseconds: 10000);
  final Duration writeTimeOutMls = const Duration(milliseconds: 10000);

  DioBuilder({required BaseOptions options}) {
    options = BaseOptions(
      baseUrl: options.baseUrl,
      contentType: contentType,
      connectTimeout: connectionTimeOutMls,
      followRedirects: false,
      receiveTimeout: readTimeOutMls,
      sendTimeout: writeTimeOutMls,
      validateStatus: (status) {
        return status! < 500;
      },
    );

    this.options = options;

    interceptors.add(HeaderInterceptor());

    httpClientAdapter = HttpClientAdapter();
  }
}
