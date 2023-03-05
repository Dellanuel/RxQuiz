import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pharm_quiz/UI/Screens/Profile/widgets.dart';
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
  late List<SalesData> _chartData;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();

    super.initState();
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30)
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    final color = <Color>[];
    color.add(Get.theme.primaryColor.withOpacity(.6));
    color.add(Get.theme.primaryColor.withOpacity(.4));
    color.add(Get.theme.primaryColor.withOpacity(.2));

    final gradientColors = LinearGradient(
      colors: color,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton(),
        title: Text(
          'Statistics',
          style: bigBolo,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: curved,
                  border: Border.all(width: 1, color: greyK.withOpacity(.5))),
              child: SfCartesianChart(
                title: ChartTitle(
                  borderColor: Colors.black26,
                  text: 'Points so far',
                  textStyle: poppins,
                  alignment: ChartAlignment.center,
                ),
                // legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                plotAreaBorderWidth: 0,
                axes: [
                  NumericAxis(majorGridLines: const MajorGridLines(width: 0)),
                ],
                primaryXAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines:
                      const MajorTickLines(color: Colors.transparent),
                ),
                primaryYAxis: NumericAxis(
                  majorTickLines:
                      const MajorTickLines(color: Colors.transparent),
                  axisLine: const AxisLine(width: 0),
                  majorGridLines: const MajorGridLines(width: 0),
                  minimum: 0,
                  maximum: 100,
                ),
                series: <SplineAreaSeries>[
                  SplineAreaSeries<SalesData, double>(
                    markerSettings: MarkerSettings(
                      borderColor: whiteK,
                      borderWidth: 3,
                      color: Get.theme.primaryColor,
                      isVisible: true,
                      shape: DataMarkerType.circle,
                    ),
                    dataSource: _chartData,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                    color: Get.theme.primaryColor,
                    borderWidth: 5,
                    borderColor: Get.theme.primaryColor,
                    gradient: gradientColors,
                    splineType: SplineType.cardinal,
                  )
                ],
              ),
            ),
            Text(
              'Your Achievements',
              style: bolo.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ).paddingSymmetric(horizontal: 21, vertical: 5),
            Row(
              children: [
                Expanded(
                    child: achievementTile(
                        subtitle: 'RxQuiz',
                        leading: Icon(
                          Icons.numbers_outlined,
                          color: Get.theme.primaryColor,
                        ),
                        title: '10')),
                const SizedBox(width: 10),
                Expanded(
                    child: achievementTile(
                        subtitle: 'Total points',
                        leading: const Icon(
                          Icons.local_fire_department,
                          color: Colors.amber,
                        ),
                        title: '10'))
              ],
            ).paddingSymmetric(horizontal: 21),
            Row(
              children: [
                Expanded(
                    child: achievementTile(
                        subtitle: 'Quiz passed',
                        leading: const Icon(
                          Ionicons.thumbs_up_outline,
                          color: Colors.orange,
                        ),
                        title: '10')),
                const SizedBox(width: 10),
                Expanded(
                    child: achievementTile(
                        subtitle: 'Fastest record',
                        leading: const Icon(
                          Ionicons.speedometer,
                          color: Colors.red,
                        ),
                        title: '10'))
              ],
            ).paddingSymmetric(horizontal: 21),
            Row(
              children: [
                Expanded(
                    child: achievementTile(
                        subtitle: 'Challenges completed',
                        leading: const Icon(
                          Ionicons.shield_checkmark_sharp,
                          color: Colors.blueAccent,
                        ),
                        title: '10')),
                const SizedBox(width: 10),
                Expanded(
                    child: achievementTile(
                        subtitle: 'RxQuiz',
                        leading: const Icon(
                          Icons.circle_rounded,
                          color: Colors.amber,
                        ),
                        title: '10'))
              ],
            ).paddingSymmetric(horizontal: 21)
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}

// ///radial bar for user success{success page}
// Widget radialBarWidget() {
//   return SfCircularChart(
//     margin: const EdgeInsets.all(0),
//     series: <RadialBarSeries<ChartData, String>>[
//       RadialBarSeries<ChartData, String>(
//         maximumValue: 100,
//         radius: '100%',
//         gap: '15%',
//         strokeWidth: 3,
//         innerRadius: '30%',
//         dataSource: <ChartData>[
//           ChartData(
//             x: 'Move 65%\n338/520 CAL',
//             y: 65,
//             text: 'Move  ',
//           ),
//           ChartData(
//             x: 'Exercise 43%\n13/30 MIN',
//             y: 43,
//             text: 'Exercise  ',
//           ),
//         ],
//         cornerStyle: CornerStyle.bothCurve,
//         xValueMapper: (ChartData data, _) => data.x as String,
//         yValueMapper: (ChartData data, _) => data.y,
//         dataLabelMapper: (ChartData data, _) => data.text,
//         dataLabelSettings: const DataLabelSettings(isVisible: true),
//       )
//     ],
//     tooltipBehavior: TooltipBehavior(),
//   );
// }
