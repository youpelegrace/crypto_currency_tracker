import 'package:dio/dio.dart';
import 'package:flutter_application_3/core/global/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Constants.token);

    if (options.headers.containsKey('requireToken')) {
      options.headers.addAll({"Authorization": "Bearer $token"});
      // remove the auxilliary header
      options.headers.remove('requireToken');
    } else {
      options.headers.remove('requireToken');
    }

    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    // options.headers.addAll({"X-Api-Key": "${Globals.xAPIKey}"});

    return super.onRequest(options, handler);
  }
}

@override
Future onResponse(Response response, ResponseInterceptorHandler handler) async {
  // print('RESPONSE[${response.statusCode}] => PATH: ${response.request?.path}');
  print("Headers:");
  response.headers.forEach((k, v) => print('$k: $v'));
  print("Response: ${response.data}");
  print("<-- END HTTP");
  // }
  return handler.next(response);
}
