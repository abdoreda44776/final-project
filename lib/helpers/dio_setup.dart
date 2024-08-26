import 'package:dio/dio.dart';

class DioSetup {
  static Dio createAndSetUpDio() {
    Dio dio = Dio();
    dio
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10);

    dio.interceptors.add(LogInterceptor(
      error: true,
      requestBody: true,
      request: true,
      responseBody: true,
      requestHeader: false,
      responseHeader: false,
    ));
    return dio;
  }
}