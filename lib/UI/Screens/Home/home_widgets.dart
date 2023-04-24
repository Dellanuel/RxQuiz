import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/quiz_create.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/quiz_details.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../Functions/user_func.dart';
import '../../strings.dart';
import '../../../Functions/datastore_func.dart';

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
Widget discoverQuiz({required int dataLength, required List<QuizModel> data}) {
  return SizedBox(
      height: 208,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            dataLength,
            (index) => GestureDetector(
              onTap: () {
                Get.to(() => QuizDetails(index: index,data: data));
              },
              child: Container(
                width: 135,
                decoration: BoxDecoration(borderRadius: curved),
                child: discoverWidget(index: index, data: data),
              ),
            ),
          ),
        ),
      ));
}

Widget discoverWidget({required int index, required List<QuizModel> data}) {
  return ListTile(
    dense: true,
    minVerticalPadding: 0,
    contentPadding: const EdgeInsets.all(0),
    title: SizedBox(
      height: 100,
      child: Center(
        child: Image.asset(data[index].fieldImage ?? 'assets/image/ico_1.png'),
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
            data[index].name!,
            style: montserrat.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(flex: 1),
          Text(
            data[index].course!,
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
                data[index].authorsname!,
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
          child: const Center(
              // child: Image.asset(
              //   '',
              //   fit: BoxFit.fill,
              // ),
              ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: curved),
      ).paddingSymmetric(horizontal: 22),
    ],
  );
}
