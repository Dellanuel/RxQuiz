import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../utils/dummy_data.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.blue);
    color.add(Colors.blue[100]!);
    color.add(Colors.blue[50]!);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);
    final LinearGradient gradientColors = LinearGradient(
        colors: color,
        stops: stops,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton(),
        title: Text(
          'Statistics',
          style: bigBolo,
        ),
      ),
      body: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <SplineAreaSeries<SalesData, String>>[
              SplineAreaSeries<SalesData, String>(
                  dataSource: <SalesData>[
                    SalesData('Jan', 85),
                    SalesData('Feb', 58),
                    SalesData('Mar', 64),
                    SalesData('Apr', 62),
                    SalesData('May', 78),
                    SalesData('Jun', 92),
                    SalesData('Jul', 90),
                  ],
                  emptyPointSettings: EmptyPointSettings(
                      borderWidth: 0,
                      borderColor: whiteK,
                      color: whiteK,
                      mode: EmptyPointMode.zero),
                  cardinalSplineTension: 0.5,
                  splineType: SplineType.clamped,
                  borderColor: Get.theme.primaryColor,
                  borderDrawMode: BorderDrawMode.top,
                  opacity: .5,
                  dashArray: [0, 1],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  gradient: gradientColors,
                  borderWidth: 5,
                  isVisible: true,
                  isVisibleInLegend: true,
                  markerSettings:
                      MarkerSettings(isVisible: false, borderColor: Colors.red),
                  trendlines: [Trendline(isVisible: false)],
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      connectorLineSettings: ConnectorLineSettings(
                          color: whiteK, type: ConnectorType.curve)),
                  // emptyPointSettings: EmptyPointSettings(
                  //     mode: EmptyPointMode.zero, color: whiteK),
                  enableTooltip: true),
            ],
          )
          // SfSparkLineChart(
          //   //Enable the trackball
          //   trackball: SparkChartTrackball(
          //       activationMode: SparkChartActivationMode.tap),
          //   //Enable marker
          //   marker:
          //       SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
          //   //Enable data label
          //   labelDisplayMode: SparkChartLabelDisplayMode.all,
          //   data: <double>[
          //     1,
          //     5,
          //     -6,
          //     0,
          //     1,
          //     -2,
          //     7,
          //     -7,
          //     -4,
          //     -10,
          //     13,
          //     -6,
          //     7,
          //     5,
          //     11,
          //     5,
          //     3
          //   ],
          // )
          // SfCartesianChart(
          //     primaryXAxis: CategoryAxis(),
          //     // Chart title
          //     // title: ChartTitle(text: 'Half yearly sales analysis'),
          //     // Enable legend
          //     // legend: Legend(isVisible: true),
          //     // Enable tooltip
          //     tooltipBehavior: _tooltipBehavior,
          //     series: <LineSeries<SalesData, String>>[
          //       LineSeries<SalesData, String>(
          //           dataSource: <SalesData>[
          //             SalesData('Jan', 35),
          //             SalesData('Feb', 28),
          //             SalesData('Mar', 34),
          //             SalesData('Apr', 32),
          //             SalesData('May', 40)
          //           ],
          //           xValueMapper: (SalesData sales, _) => sales.year,
          //           yValueMapper: (SalesData sales, _) => sales.sales,
          //           // Enable data label
          //           dataLabelSettings: DataLabelSettings(isVisible: true))
          //     ])
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

///radial bar for user success{success page}
Widget radialBarWidget() {
  return SfCircularChart(
    margin: const EdgeInsets.all(0),
    series: <RadialBarSeries<ChartData, String>>[
      RadialBarSeries<ChartData, String>(
        maximumValue: 100,
        radius: '100%',
        gap: '15%',
        strokeWidth: 3,
        innerRadius: '30%',
        dataSource: <ChartData>[
          ChartData(
            x: 'Move 65%\n338/520 CAL',
            y: 65,
            text: 'Move  ',
          ),
          ChartData(
            x: 'Exercise 43%\n13/30 MIN',
            y: 43,
            text: 'Exercise  ',
          ),
        ],
        cornerStyle: CornerStyle.bothCurve,
        xValueMapper: (ChartData data, _) => data.x as String,
        yValueMapper: (ChartData data, _) => data.y,
        dataLabelMapper: (ChartData data, _) => data.text,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
      )
    ],
    tooltipBehavior: TooltipBehavior(),
  );
}
