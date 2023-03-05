import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/quiz_create.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/quiz_details.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../utils/dummy_data.dart';
import '../../strings.dart';

/// features widget data
class FeaturesWidgetData {
  String? name;
  void Function()? function;

  FeaturesWidgetData({
    this.function,
    this.name,
  });
}

/// features widget data
List<FeaturesWidgetData> featuresWidgetData = [
  FeaturesWidgetData(
    name: 'Create Quiz',
    function: () {
      Get.to(() => const CreateQZ());
    },
  ),
  FeaturesWidgetData(
    name: 'Live Quiz',
    function: () {},
  ),
  FeaturesWidgetData(
    name: 'Results',
    function: () {},
  ),
  FeaturesWidgetData(
    name: 'Scoreboard',
    function: () {},
  ),
  FeaturesWidgetData(
    name: 'Practice',
    function: () {},
  )
];

/// Room widget data

/// elevated ListTile
Widget textButton(
    {required void Function()? function, required String? title}) {
  return ElevatedButton(
    onPressed: function,
    style: textButtonStyl,
    child: Center(
      child: Text(
        title!,
        style: poppins.copyWith(fontWeight: FontWeight.w500),
      ),
    ).paddingSymmetric(horizontal: 15, vertical: 10),
  );
}

/// widget show the users recent quiz score and progress
/// as well as name and basic info
Widget dashBoard({
  width,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 18),
    height: 150,
    // color: lightSeaBlueK,
    padding: const EdgeInsets.all(5),
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        appLogo(),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Text("Glad to have you.",
                    style: montserrat.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    )),
              ),
              SizedBox(
                width: 170,
                child: Text("Practice, join & test your sklls. $appname.",
                    style: montserrat.copyWith(
                      color: greyK.withOpacity(.5),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// widget showing all available rooms for quizez.
Widget discoverQuiz() {
  return SizedBox(
      height: 208,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            quizModelData.getRange(0, 6).length,
            (index) => Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: curved,
              ),
              child: InkWell(
                onTap: () {
                  Get.to(() => QuizDetails(index: index));
                },
                borderRadius: curved,
                child: Container(
                  width: 135,
                  decoration: BoxDecoration(
                      color: quizModelData[index].color!.withOpacity(.3),
                      borderRadius: curved),
                  child: discoverWidget(index),
                ),
              ),
            ),
          ),
        ),
      ));
}

Widget discoverWidget(int index) {
  return ListTile(
    dense: true,
    minVerticalPadding: 0,
    tileColor: whiteK,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1, color: greyK.withOpacity(.3)),
      borderRadius: curved,
    ),
    contentPadding: const EdgeInsets.all(0),
    title: SizedBox(
      height: 100,
      child: Center(
        child: Lottie.asset(
          quizModelData[index].fieldImage!,
          repeat: false,
          fit: BoxFit.fill,
        ),
      ),
    ),
    subtitle: Container(
      height: 90,
      decoration: BoxDecoration(color: whiteK, borderRadius: curved),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quizModelData[index].quizname!,
            style: montserrat.copyWith(
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(flex: 1),
          Text(
            quizModelData[index].course!,
            style: abeezee.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(flex: 2),
          Row(
            children: [
              const CircleAvatar(
                radius: 10,
              ),
              const SizedBox(width: 5),
              Text(
                quizModelData[index].authorsname!,
                overflow: TextOverflow.ellipsis,
                style: raleway.copyWith(
                  fontSize: 11,
                  color: blackK.withOpacity(.8),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(10),
    ),
  );
}

List trending = [3, 2, 1, 1];

/// this widget show the various available features of the app
/// available to users
Widget trendingWidget() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Trending Quiz',
        style: bolo.copyWith(fontWeight: FontWeight.w600),
      ).paddingSymmetric(horizontal: 22, vertical: 10),
      ListTile(
        onTap: () {},
        tileColor: deepSeaBlueK,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'quizname',
              style: poppins.copyWith(
                color: whiteK,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'course',
              style: abeezee.copyWith(
                fontSize: 12,
                color: greyK,
                overflow: TextOverflow.ellipsis,
              ),
            ).paddingOnly(bottom: 5),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 12).paddingOnly(right: 10),
                Text(
                  'authorsname',
                  style: abeezee.copyWith(
                    color: whiteK,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: curved,
            color: whiteK,
          ),
          width: 50,
          child: Center(
            child: Lottie.asset(
              colLottie,
              repeat: false,
              fit: BoxFit.fill,
            ),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: curved),
      ).paddingSymmetric(horizontal: 22),
    ],
  );
}
