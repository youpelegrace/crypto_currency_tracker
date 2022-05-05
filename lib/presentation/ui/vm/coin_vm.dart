import 'package:flutter_application_3/core/controller/generic_state_notifier.dart';
import 'package:flutter_application_3/core/repository/coin_repository.dart';
import 'package:flutter_application_3/core/services/model/coin_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCoinProvider = StateNotifierProvider<CoinVM, RequestState>(
  (
    ref,
  ) =>
      CoinVM(ref),
);

class CoinVM extends RequestStateNotifier {
  final CoinRepository _coinRepository;

  CoinVM(ProviderRefBase ref) : _coinRepository = ref.read(coinProvider) {
    getCoin();
  }

  void getCoin() => makeRequest(() => _coinRepository.getCoin());
  void searchBy(String ids) => makeRequest(() => _coinRepository.getCoin(ids));
}





// final getCoinProvider = StateNotifierProvider<CoinVM, RequestState>(
//   (ref) => CoinVM(ref),
// );

// class CoinVM extends RequestStateNotifier {
//   final CoinRepository _coinRepository;

//   CoinVM(ProviderRefBase ref)
//       : _coinRepository = ref.read(coinProvider);

//   void getCoin() =>
//       makeRequest(() => _coinRepository.getCoin());
// }
