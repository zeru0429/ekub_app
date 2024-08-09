import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RangeColumSfWidget extends StatelessWidget {
  const RangeColumSfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [
      ChartData('Jan', 3, 9),
      ChartData('Feb', 4, 11),
      ChartData('Mar', 6, 13),
      ChartData('Apr', 9, 17),
      ChartData('May', 12, 20),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries>[
          RangeColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            lowValueMapper: (ChartData data, _) => data.low,
            highValueMapper: (ChartData data, _) => data.high,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.high, this.low);
  final String x;
  final double high;
  final double low;
}
