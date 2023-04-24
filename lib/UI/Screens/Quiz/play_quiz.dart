import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../Functions/datastore_func.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({super.key, required this.index});
  final int index;
  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  int answered = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        title: Text( 'Quiz',
          style: bigBolo.copyWith(color: whiteK),
        ),
        leading: Center(
          child: Text(
            '1000',
            style: raleway.copyWith(color: whiteK),
          ),
        ),
        actions: [
          appbarButton(
            onpressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.info,
              color: whiteK,
            ),
          ),
        ],
      ),
    );
  }
}
