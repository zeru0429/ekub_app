import 'package:ekub_app/common/widgets/charts/sycfusion/area_chart_sf.dart';
import 'package:ekub_app/common/widgets/charts/sycfusion/fast_line_chart_sf.dart';
import 'package:ekub_app/common/widgets/charts/sycfusion/histogram_chart_sf.dart';
import 'package:ekub_app/common/widgets/charts/sycfusion/line_chart_sf.dart';
import 'package:ekub_app/common/widgets/charts/sycfusion/pi_chart_segmented_sf.dart';
import 'package:ekub_app/common/widgets/charts/sycfusion/pi_chart_sf.dart';
import 'package:ekub_app/common/widgets/charts/sycfusion/radial_chart_sf.dart';
import 'package:ekub_app/common/widgets/charts/sycfusion/range_colum_sf.dart';
import 'package:ekub_app/common/widgets/charts/sycfusion/spline_chart_sf.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LineChartSfWidget(),
            AreaChartSfWidget(),
            FastLineChartSfWidget(),
            SplineChartSfWidget(),
            RadialChartSfWidget(),
            PiChartSegmentedSfWidget(),
            PiChartSfWidget(),
            HistogramChartSfWidegt(),
            RangeColumSfWidget(),
          ],
        ),
      ),
    );
  }
}
