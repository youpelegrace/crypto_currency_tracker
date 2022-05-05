import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/services/model/chart_model.dart'
    as eos;

import 'package:flutter_application_3/presentation/ui/vm/chart_data_vm.dart';
import 'package:flutter_application_3/presentation/ui/widgets/appbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveStats extends HookConsumerWidget {
  // final ChartData? chartData;
  final String id;
  const LiveStats({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(getChartDataProvider(id));
    bool _enableSolidCandle = false;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        flexibleSpace: SafeArea(
          child: BarRow(text: "BRG/BTC", icons: Icons.share),
        ),
      ),
      body: Column(
        children: [
          Text(
            "\$108.84",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "\$50.66",
            style: TextStyle(color: Colors.greenAccent, fontSize: 13),
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
                  volume: datas.marketData!.athChangePercentage![datas.symbol],
                  convertedVolume: datas.marketData!.athChangePercentage,
                  coinId: id),
              eos.Ticker(
                  lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                  last: datas.marketData!
                      .priceChangePercentage60DInCurrency![datas.symbol],
                  convertedVolume: datas.marketData!.athChangePercentage,
                  volume: datas.marketData!.athChangePercentage![datas.symbol],
                  coinId: id),
              eos.Ticker(
                  lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                  last: datas
                      .marketData!.priceChangePercentage14DInCurrency!["btc"],
                  convertedVolume: datas.marketData!.athChangePercentage,
                  volume: datas.marketData!.atlChangePercentage![datas.symbol],
                  coinId: id),
              eos.Ticker(
                  lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                  last: datas.marketData!
                      .priceChangePercentage14DInCurrency![datas.symbol],
                  convertedVolume: datas.marketData!.athChangePercentage,
                  volume: datas.marketData!.athChangePercentage![datas.symbol],
                  coinId: id),
              eos.Ticker(
                  lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                  last: datas.marketData!
                      .priceChangePercentage7DInCurrency![datas.symbol],
                  convertedVolume: datas.marketData!.athChangePercentage,
                  volume: datas.marketData!.atlChangePercentage![datas.symbol],
                  coinId: id),
              eos.Ticker(
                  lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                  last: datas.marketData!
                      .priceChangePercentage200DInCurrency![datas.symbol],
                  convertedVolume: datas.marketData!.athChangePercentage,
                  volume: datas.marketData!.atlChangePercentage![datas.symbol],
                  coinId: id),
              eos.Ticker(
                  lastFetchAt: datas.marketData!.atlDate![datas.symbol],
                  last: datas.marketData!
                      .priceChangePercentage1YInCurrency![datas.symbol],
                  convertedVolume: datas.marketData!.athChangePercentage,
                  volume: datas.marketData!.athChangePercentage![datas.symbol],
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
                    maximum: DateTime(2021, 12, 30),

                    majorGridLines: const MajorGridLines(width: 0),
                    // interval: 2,
                  ),
                  primaryYAxis: NumericAxis(axisLine: const AxisLine(width: 0)),
                  series: <CandleSeries<eos.Ticker, DateTime>>[
                    CandleSeries<eos.Ticker, DateTime>(
                      enableSolidCandles: _enableSolidCandle,
                      dataSource: tickers,
                      xValueMapper: (eos.Ticker data, _) =>
                          DateFormat("yyyy-MM-DD")
                              .parse(data.lastFetchAt!.toIso8601String()),
                      lowValueMapper: (eos.Ticker data, _) => data.last,
                      highValueMapper: (eos.Ticker data, _) => data.volume,
                      openValueMapper: (eos.Ticker data, _) =>
                          data.convertedVolume![datas.symbol],

                      closeValueMapper: (eos.Ticker data, _) => data.last,

                      // yValueMapper: (eos.Ticker data, _) => data.last
                    ),
                  ]),
            );
            // final List<Ticker> tickers = [
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate![datas.symbol],
            //       last: datas.marketData!
            //           .priceChangePercentage200DInCurrency![datas.symbol],
            //       volume: datas.marketData!.athChangePercentage![datas.symbol],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate![datas.symbol],
            //       last: datas.marketData!
            //           .priceChangePercentage60DInCurrency![datas.symbol],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage![datas.symbol],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate![datas.symbol],
            //       last: datas
            //           .marketData!.priceChangePercentage14DInCurrency!["btc"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.atlChangePercentage![datas.symbol],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate![datas.symbol],
            //       last: datas.marketData!
            //           .priceChangePercentage14DInCurrency![datas.symbol],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage![datas.symbol],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate![datas.symbol],
            //       last: datas.marketData!
            //           .priceChangePercentage7DInCurrency![datas.symbol],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.atlChangePercentage![datas.symbol],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate![datas.symbol],
            //       last: datas.marketData!
            //           .priceChangePercentage200DInCurrency![datas.symbol],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.atlChangePercentage![datas.symbol],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate![datas.symbol],
            //       last: datas.marketData!
            //           .priceChangePercentage1YInCurrency![datas.symbol],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage![datas.symbol],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate!["ngn"],
            //       last: datas
            //           .marketData!.priceChangePercentage60DInCurrency!["ngn"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage!["ngn"],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate!["mmk"],
            //       last: datas
            //           .marketData!.priceChangePercentage60DInCurrency!["mmk"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage!["mmk"],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate!["lkr"],
            //       last: datas
            //           .marketData!.priceChangePercentage60DInCurrency!["lkr"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage!["lkr"],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate!["clp"],
            //       last: datas
            //           .marketData!.priceChangePercentage60DInCurrency!["clp"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage!["clp"],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate!["pkr"],
            //       last: datas
            //           .marketData!.priceChangePercentage60DInCurrency!["pkr"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage!["pkr"],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate!["sar"],
            //       last: datas
            //           .marketData!.priceChangePercentage60DInCurrency!["sar"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage!["sar"],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate!["nok"],
            //       last: datas
            //           .marketData!.priceChangePercentage60DInCurrency!["nok"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage!["nok"],
            //       coinId: id),
            //   Ticker(
            //       lastFetchAt: datas.marketData!.atlDate!["bhd"],
            //       last: datas
            //           .marketData!.priceChangePercentage60DInCurrency!["bhd"],
            //       convertedVolume: datas.marketData!.athChangePercentage,
            //       volume: datas.marketData!.athChangePercentage!["bhd"],
            //       coinId: id),
            // ];
            // return Container(
            //   // height: 300,
            //   width: MediaQuery.of(context).size.width,
            //   child: SfCartesianChart(
            //     plotAreaBorderWidth: 0,
            //     legend: Legend(isVisible: false),
            //     // tooltipBehavior: TooltipBehavior,
            //     series: <ChartSeries>[
            //       AreaSeries<Ticker, dynamic>(
            //         name: 'Sales',
            //         dataSource: tickers,
            //         xValueMapper: (Ticker result, _) => DateFormat("yyyy-MM-DD")
            //             .parse(result.lastFetchAt!.toIso8601String()),
            //         yValueMapper: (Ticker result, _) =>
            //             result.convertedVolume![datas.symbol],
            //         dataLabelSettings: DataLabelSettings(isVisible: true),
            //         enableTooltip: true,
            //       )
            //     ],

            //     primaryXAxis: NumericAxis(
            //       edgeLabelPlacement: EdgeLabelPlacement.shift,
            //     ),
            //     primaryYAxis: NumericAxis(
            //         minimum: 10.0,
            //         labelFormat: '{value}',
            //         numberFormat: NumberFormat.simpleCurrency()),
            //   ),
            // );
          }, loading: (AsyncValue<eos.ChartData>? previous) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, error: (Object error, StackTrace? stackTrace,
              AsyncData<eos.ChartData>? previous) {
            return Text(error.toString());
          })
        ],
      ),
    );
  }
}
