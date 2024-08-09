import 'package:ekub_app/common/widgets/charts/sycfusion/line_chart_sf.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineChartSfWidget extends StatelessWidget {
  const SplineChartSfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 35),
      ChartData(2011, 13),
      ChartData(2012, 34),
      ChartData(2013, 27),
      ChartData(2014, 40)
    ];
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SfCartesianChart(series: <CartesianSeries>[
          SplineSeries<ChartData, int>(
              dataSource: chartData,
              // Dash values for spline
              dashArray: const <double>[5, 5],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]));
  }
}
