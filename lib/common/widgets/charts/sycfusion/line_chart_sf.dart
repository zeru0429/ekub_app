import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartSfWidget extends StatefulWidget {
  const LineChartSfWidget({super.key});

  @override
  State<LineChartSfWidget> createState() => _LineChartSfWidgetState();
}

class _LineChartSfWidgetState extends State<LineChartSfWidget> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 35),
      ChartData(2011, 28),
      ChartData(2012, 34),
      ChartData(2013, 32),
      ChartData(2014, 40)
    ];

    return SfCartesianChart(
      series: <CartesianSeries>[
        // Renders line chart
        LineSeries<ChartData, int>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
