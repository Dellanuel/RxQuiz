import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
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
  IconData? icon;

  FeaturesWidgetData({
    this.function,
    this.name,
  });
}

/// features widget data
List<FeaturesWidgetData> featuresWidgetData = [
  FeaturesWidgetData(
    name: 'Quick Quiz',
    function: () {},
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
class RoomWidgetData {
  String? field;
  String? roomname;
  int? participantsnumber;

  RoomWidgetData({
    this.roomname,
    this.participantsnumber,
    this.field,
  });
}

List<RoomWidgetData> roomwidgetData = [
  RoomWidgetData(
    field: phar,
    participantsnumber: 5,
    roomname: 'Pharmceutics',
  ),
  RoomWidgetData(
    field: chem,
    participantsnumber: 5,
    roomname: 'Pharm Chem',
  ),
  RoomWidgetData(
    field: cog,
    participantsnumber: 5,
    roomname: 'Cognosy',
  ),
  RoomWidgetData(
    field: col,
    participantsnumber: 5,
    roomname: 'Cology',
  ),
  RoomWidgetData(
    field: mcb,
    participantsnumber: 5,
    roomname: 'Pharm MCB',
  ),
  RoomWidgetData(
    field: bch,
    participantsnumber: 5,
    roomname: 'Pharm BCH',
  ),
  RoomWidgetData(
    field: cli,
    participantsnumber: 5,
    roomname: 'Clinical Pharm',
  ),
  RoomWidgetData(
    field: tech,
    roomname: 'Pharm Tech',
    participantsnumber: 5,
  ),
  RoomWidgetData(
    field: sap,
    participantsnumber: 5,
    roomname: 'SAP-Pharm',
  ),
];

/// elevated ListTile
Widget textButton(
    {required void Function()? function, required String? title}) {
  return ElevatedButton(
    onPressed: function,
    style: textButtonStyl,
    child: Center(
      child: Text(
        title!,
        style: poppins.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    ).paddingSymmetric(horizontal: 15, vertical: 10),
  );
}

/// this widget show the various available features of the app
/// available to users
Widget featuresWidget() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
              featuresWidgetData.length,
              (index) => textButton(
                    function: featuresWidgetData[index].function,
                    title: featuresWidgetData[index].name!,
                  ).marginOnly(left: 7)),
        ).paddingSymmetric(vertical: 5),
      ),
      const SizedBox(height: 15),
      Text(
        'Recent Quiz',
        style: bolo.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
      ).paddingOnly(left: 22, bottom: 10, top: 5),
      ListTile(
        onTap: () {},
        tileColor: deepSeaBlueK,
        leading: Card(
          shape: const CircleBorder(),
          color: deepSeaBlueK,
          elevation: 5,
          child: Icon(
            CupertinoIcons.question_circle,
            size: 35,
            color: whiteK,
          ),
        ),
        title: Text(
          'Quiz Name',
          style: abeezee.copyWith(
            color: whiteK,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          'status: ',
          style: montserrat.copyWith(
            color: whiteK,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: CircularProgressIndicator(
          backgroundColor: whiteK.withOpacity(.3),
          valueColor: AlwaysStoppedAnimation<Color>(whiteK),
          value: .7,
        ).paddingOnly(right: 5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ).paddingSymmetric(horizontal: 22)
    ],
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
SizedBox roomsWidget() {
  return SizedBox(
      height: 190,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            roomwidgetData.length,
            (index) => Container(
              height: 160,
              width: 120,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [lightSeaBlueK, deepSeaBlueK]),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(left: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: const Alignment(-1.0, -0.8),
                    child: Lottie.asset(
                      roomwidgetData[index].field!,
                      repeat: false,
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.8, -1.40),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: Get.theme.canvasColor,
                      ),
                      child: Text(
                        '0${(index + 1).toString()}',
                        style: bolo.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      dense: true, tileColor: whiteK,
                      // tileColor: const Color(0xff3b8aa9),
                      contentPadding: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(
                        'participants: ${roomwidgetData[index].participantsnumber.toString()}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      subtitle: Text(
                        roomwidgetData[index].roomname!,
                        style: montserrat.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
}
