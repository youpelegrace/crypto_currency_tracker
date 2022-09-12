import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/services/model/chart_model.dart'
    as eos;
import 'package:flutter_application_3/core/services/model/coin_model.dart';

import 'package:flutter_application_3/presentation/ui/vm/chart_data_vm.dart';
import 'package:flutter_application_3/presentation/widgets/shimmer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveStats extends HookConsumerWidget {
  final Btc? item;
  final String id;
  const LiveStats({
    Key? key,
    this.item,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var format = NumberFormat("###,###", "en_US");
    final vm = ref.watch(getChartDataProvider(id));
    bool _enableSolidCandle = false;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "BRG/BTC",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await Share.share('https://pro-api.coingecko.com/api/v3/',
                    subject: "share");
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Text(
              "\$" + format.format(item!.marketCap),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              item!.marketCapChangePercentage24H!.toStringAsFixed(1) + "%",
              style: TextStyle(
                  color: item!.marketCapChangePercentage24H! > 0.0
                      ? Colors.greenAccent[400]
                      : Colors.red,
                  fontSize: 13),
            ),
            SizedBox(
              height: 50,
            ),
            vm.when(data: (datas) {
              final List<eos.Ticker> tickers = [
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                    last: datas.marketData!
                        .priceChangePercentage200DInCurrency![datas.symbol],
                    volume:
                        datas.marketData!.athChangePercentage![datas.symbol],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                    last: datas.marketData!
                        .priceChangePercentage60DInCurrency![datas.symbol],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume:
                        datas.marketData!.athChangePercentage![datas.symbol],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                    last: datas
                        .marketData!.priceChangePercentage14DInCurrency!["btc"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume:
                        datas.marketData!.atlChangePercentage![datas.symbol],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                    last: datas.marketData!
                        .priceChangePercentage14DInCurrency![datas.symbol],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume:
                        datas.marketData!.athChangePercentage![datas.symbol],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                    last: datas.marketData!
                        .priceChangePercentage7DInCurrency![datas.symbol],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume:
                        datas.marketData!.atlChangePercentage![datas.symbol],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                    last: datas.marketData!
                        .priceChangePercentage200DInCurrency![datas.symbol],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume:
                        datas.marketData!.atlChangePercentage![datas.symbol],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                    last: datas.marketData!
                        .priceChangePercentage1YInCurrency![datas.symbol],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume:
                        datas.marketData!.athChangePercentage![datas.symbol],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate!["ngn"],
                    last: datas
                        .marketData!.priceChangePercentage60DInCurrency!["ngn"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume: datas.marketData!.athChangePercentage!["ngn"],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate!["mmk"],
                    last: datas
                        .marketData!.priceChangePercentage60DInCurrency!["mmk"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume: datas.marketData!.athChangePercentage!["mmk"],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate!["lkr"],
                    last: datas
                        .marketData!.priceChangePercentage60DInCurrency!["lkr"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume: datas.marketData!.athChangePercentage!["lkr"],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate!["clp"],
                    last: datas
                        .marketData!.priceChangePercentage60DInCurrency!["clp"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume: datas.marketData!.athChangePercentage!["clp"],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate!["pkr"],
                    last: datas
                        .marketData!.priceChangePercentage60DInCurrency!["pkr"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume: datas.marketData!.athChangePercentage!["pkr"],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate!["sar"],
                    last: datas
                        .marketData!.priceChangePercentage60DInCurrency!["sar"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume: datas.marketData!.athChangePercentage!["sar"],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate!["nok"],
                    last: datas
                        .marketData!.priceChangePercentage60DInCurrency!["nok"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume: datas.marketData!.athChangePercentage!["nok"],
                    coinId: id),
                eos.Ticker(
                    lastFetchAt: datas.marketData!.atlDate!["bhd"],
                    last: datas
                        .marketData!.priceChangePercentage60DInCurrency!["bhd"],
                    convertedVolume: datas.marketData!.athChangePercentage,
                    volume: datas.marketData!.athChangePercentage!["bhd"],
                    coinId: id),
              ];
              return Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: DateTimeAxis(
                      // dateFormat: DateFormat.MMM(),
                      minimum: DateTime(2013, 01, 01),
                      maximum: DateTime(2022, 12, 30),

                      majorGridLines: const MajorGridLines(width: 0),
                      // interval: 2,
                    ),
                    primaryYAxis:
                        NumericAxis(axisLine: const AxisLine(width: 0)),
                    series: <CandleSeries<eos.Ticker, DateTime>>[
                      CandleSeries<eos.Ticker, DateTime>(
                        enableSolidCandles: _enableSolidCandle,
                        dataSource: tickers,
                        xValueMapper: (eos.Ticker data, _) =>
                            DateFormat("yyyy-MM-DD")
                                .parse(data.lastFetchAt!.toIso8601String()),
                        lowValueMapper: (eos.Ticker data, _) => data.last ?? 0,
                        highValueMapper: (eos.Ticker data, _) =>
                            data.volume ?? 0,
                        openValueMapper: (eos.Ticker data, _) =>
                            data.convertedVolume![datas.symbol] ?? 0,
                        closeValueMapper: (eos.Ticker data, _) =>
                            data.last ?? 0,
                      ),
                    ]),
              );
            }, loading: (AsyncValue<eos.ChartData>? previous) {
              return chartShimmer();
            }, error: (Object error, StackTrace? stackTrace,
                AsyncData<eos.ChartData>? previous) {
              return Text(error.toString());
            })
          ],
        ),
      ),
    );
  }
}

Widget chartShimmer() {
  return Expanded(
    child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            child: Column(
              children: [
                ShimmerWidget.rectanglar(
                  height: 2,
                ),
              ],
            ),
          );
        }),
  );
}
