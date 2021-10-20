import 'package:flutter_application_3/core/services/coin_service.dart';
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
  Future getCoin([String symbol = "btc"]) async{
    final coin = await _coinService.getCoin(symbol = "btc");
    return coin;
  }


}

