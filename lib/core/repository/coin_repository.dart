import 'package:flutter_application_3/core/services/coin_service.dart';
import 'package:flutter_application_3/core/services/model/chart_model.dart';
import 'package:flutter_application_3/core/services/model/coin_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'i_coin_repository.dart';

final coinProvider = Provider<CoinRepository>((ref) {
  final coinService = ref.watch(coinServiceProvider);

  return CoinRepository(coinService);
});

class CoinRepository extends ICoinRepository {
  final CoinService _coinService;
  CoinRepository(this._coinService);

  @override
  Future getCoin([String ids = '']) async {
    final coin = await _coinService.getCoin(ids);
    return coin!;
  }

  Future<ChartData> getCionData(String ids) async {
    final coinData = await _coinService.getCionData(ids);
    return coinData;
  }
}
