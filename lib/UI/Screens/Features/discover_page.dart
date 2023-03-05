import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:pharm_quiz/UI/Screens/Profile/widgets.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../Home/home_widgets.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton(),
        title: Text(
          'Discover',
          style: bigBolo,
        ),
        actions: [
          appbarButton(
            onpressed: () {},
            icon: const Icon(Ionicons.search_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(
            quizModelData.length,
            (index) => quizTile(
              color: quizModelData[index].color,
              lottieImage: quizModelData[index].fieldImage,
              title: quizModelData[index].quizname,
              questionNum: quizModelData[index].questionnumber,
              authorsname: quizModelData[index].authorsname,
              course: quizModelData[index].course,
              date: quizModelData[index].date,
              plays: quizModelData[index].playsNum,
            ).paddingOnly(bottom: 10),
          ),
        ),
      ),
    );
  }
}
