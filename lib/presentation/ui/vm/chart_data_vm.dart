import 'package:flutter_application_3/core/repository/coin_repository.dart';
import 'package:flutter_application_3/core/services/model/chart_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getChartDataProvider =
    FutureProvider.family<ChartData, String>((ref, chartData) async {
  return ref.watch(coinProvider).getCionData(chartData);
});


// class ChartDataVM extends RequestStateNotifier {
//   final CoinRepository _coinRepository;

//   ChartDataVM(ProviderRefBase ref) : _coinRepository = ref.read(coinProvider) {
//     getCionData();
//   }

//   void getCionData(ids) => makeRequest(() => _coinRepository.getCionData(ids));
// }


// final coinByIdProvider =
//     FutureProvider.autoDispose.family<CoinById, String>((ref, coinById) async {
//   return ref.watch(cryptoProvider).getCoinbyId(coinById);
// });