import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FastLineChartSfWidget extends StatelessWidget {
  const FastLineChartSfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(DateTime(2010), 35),
      ChartData(DateTime(2011), 28),
      ChartData(DateTime(2012), 34),
      ChartData(DateTime(2013), 32),
      ChartData(DateTime(2014), 40)
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SfCartesianChart(
        primaryXAxis: const DateTimeAxis(),
        series: <CartesianSeries>[
          // Renders fast line chart
          FastLineSeries<ChartData, DateTime>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}
