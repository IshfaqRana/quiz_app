import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:trivia_app/utils/dio.dart';

import '../../utils/dio_error_handler.dart';
import '../../utils/dio_response_handler.dart';
import '../../utils/utils.dart';

class DioServices {
  DioSingleton dioHandler = DioSingleton();

  Future<ResponseHandler> get(url) async {
    dioHandler.dio_handler.interceptors.add(
      DioLoggingInterceptor(
        level: Level.basic,
        compact: false,
      ),
    );
    ResponseHandler? handler;
    try {
      var response = await dioHandler.dio_handler.get(url);
      if (response.statusCode == 200) {
        handler = ResponseHandler(true, "success", response.data);
      }
    } on DioError catch (e) {
      Utils.printDebug(e.message);
      DioExceptions.fromDioError(e).toString();

      Utils.printDebug(DioExceptions.fromDioError(e).toString());
      handler = ResponseHandler(false, e.response!.statusMessage!, null);
    }
    return handler!;
  }
}
