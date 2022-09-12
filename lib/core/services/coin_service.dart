import 'package:dio/dio.dart';
import 'package:flutter_application_3/core/global/constants.dart';
import 'package:flutter_application_3/core/services/model/chart_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_interceptor.dart';
import 'error_interceptor.dart';
import 'model/coin_model.dart';
import 'model/failure.dart';

final coinServiceProvider = Provider<CoinService>((ref) {
  return CoinService(ref.watch(dioProvider));
});

final dioProvider = Provider((ref) => Dio(BaseOptions(
    receiveTimeout: 100000,
    connectTimeout: 100000,
    // contentType: "application/json-patch+json",
    baseUrl: Constants.coinServiceBaseUrl)));

class CoinService {
  final Dio _dio;
  CoinService(this._dio) {
    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future getCoin([String ids = '']) async {
    final url = 'v3/coins/markets?vs_currency=btc';

    var queryParameters = {"ids": ids};

    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      final result = List<Btc>.from(response.data.map((x) => Btc.fromJson(x)));
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        // throw result.message!;
        throw result;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<ChartData> getCionData(String ids) async {
    final url =
        '/v3/coins/$ids?localization=false&tickers=true&community_data=false&developer_data=false';

    try {
      final response = await _dio.get(
        url,
      );
      final result = ChartData.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        // throw result.message!;
        throw result;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }
}
