// ignore_for_file: unnecessary_null_comparison, unnecessary_new

import 'package:dio/dio.dart';
import 'package:trivia_app/utils/const.dart';

class DioSingleton {
  Dio dio_handler = Dio(BaseOptions(
      receiveTimeout: 15000,
      connectTimeout: 15000,
      baseUrl: baseURL,
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType));

  DioSingleton() {
    if (dio_handler == null) {
      dio_handler = new Dio(BaseOptions(
          receiveTimeout: 15000,
          connectTimeout: 15000,
          baseUrl: baseURL,
          responseType: ResponseType.json,
          contentType: Headers.jsonContentType));
    } else {
      dio_handler;
    }
  }
}
