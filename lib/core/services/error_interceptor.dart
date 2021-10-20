import 'package:dio/dio.dart';
import 'package:flutter_application_3/utils/http_utils/http_utils.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    err = await HttpUtils.buildErrorResponse(err);
    return super.onError(err, handler);
  }
}
