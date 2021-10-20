import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_3/utils/connectivity/connectivity.dart';
import 'package:flutter_application_3/utils/http_utils/http_utils_strings.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class HttpUtils {
  static final BaseOptions options = BaseOptions(
    connectTimeout: 999990,
    receiveTimeout: 89250,
  );

  static Dio getInstance() {
    Dio dio = Dio(options)
      ..interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
          error: true,
          maxWidth: 90));
    return dio;
  }

  static Future<DioError> buildErrorResponse(DioError err) async {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        if (await ConnectionUtils.getActiveStatus()) {
          err.error = HttpErrorStrings.CONNECTION_TIMEOUT_ACTIVE;
        } else {
          err.error = HttpErrorStrings.CONNECTION_TIMEOUT_NOT_ACTIVE;
        }
        break;
      case DioErrorType.sendTimeout:
        err.error = HttpErrorStrings.SEND_TIMEOUT;
        break;
      case DioErrorType.receiveTimeout:
        err.error = HttpErrorStrings.RECEIVE_TIMEOUT;
        break;
      case DioErrorType.response:
        if (err.response!.statusCode == HttpStatus.badRequest) {
          err.error = err.response!.data.toString();
        } else if (err.response!.statusCode == HttpStatus.unauthorized) {
          err.error = 'Unauthorized';
        } else {
          err.error = HttpErrorStrings.BAD_RESPONSE;
        }
        break;
      case DioErrorType.cancel:
        err.error = HttpErrorStrings.OPERATION_CANCELLED;
        break;
      case DioErrorType.other:
        if (!await ConnectionUtils.getActiveStatus()) {
          err.error = HttpErrorStrings.DEFAULT;
        } else {
          err.error = HttpErrorStrings.BAD_RESPONSE;
        }
        break;
      default:
        err.error = HttpErrorStrings.UNKNOWN;
        break;
    }

    return err;
  }
}
