import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PiChartSegmentedSfWidget extends StatelessWidget {
  const PiChartSegmentedSfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, const Color.fromRGBO(9, 0, 136, 1)),
      ChartData('Steve', 38, const Color.fromRGBO(147, 0, 119, 1)),
      ChartData('Jack', 34, const Color.fromRGBO(228, 0, 124, 1)),
      ChartData('Others', 52, const Color.fromRGBO(255, 189, 57, 1))
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SfCircularChart(
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              explode: true,
              // Explode all the segments
              explodeAll: true)
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
