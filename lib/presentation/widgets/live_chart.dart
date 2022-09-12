// import 'package:flutter/material.dart';
// import 'package:flutter_application_3/core/services/model/chart_model.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class SalesChart extends StatefulWidget {
//   final ChartData? chartData;
//   SalesChart({Key? key, this.chartData}) : super(key: key);

//   @override
//   _SalesChartState createState() => _SalesChartState();
// }

// class _SalesChartState extends State<SalesChart> {
//   List<SalesData>? _chartData;
//   TooltipBehavior? _tooltipBehavior;

//   @override
//   void initState() {
//     _chartData = getChartData();
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final vm = ref.w
//     return Scaffold(
//       body: SfCartesianChart(
//         legend: Legend(isVisible: false),
//         tooltipBehavior: _tooltipBehavior,
//         series: <ChartSeries>[
//           AreaSeries<ChartData, dynamic>(
//             name: 'Sales',
//             dataSource: [],
//             xValueMapper: (ChartData result, _) =>
//                 double.tryParse(result.tickers.toString()),
//             yValueMapper: (ChartData result, _) =>
//                 double.tryParse(result.marketCapRank.toString()),
//             dataLabelSettings: DataLabelSettings(isVisible: true),
//             enableTooltip: true,
//           )
//         ],
//         primaryXAxis: NumericAxis(
//           edgeLabelPlacement: EdgeLabelPlacement.shift,
//         ),
//         primaryYAxis: NumericAxis(
//           labelFormat: '{value}',
//           numberFormat: NumberFormat.currency(decimalDigits: 0, symbol: "N"),
//         ),
//       ),
//     );
//   }

//   List<SalesData> getChartData() {
//     final List<SalesData> chartData = [
//       SalesData(2017, 25),
//       SalesData(2018, 12),
//       SalesData(2019, 24),
//       SalesData(2020, 18),
//       SalesData(2021, 30)
//     ];
//     return chartData;
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);
//   final double year;
//   final double sales;
// }
