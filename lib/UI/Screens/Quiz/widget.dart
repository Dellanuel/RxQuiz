import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/quiz_create.dart';

import '../../../utils/app_constants.dart';
import '../../../Functions/datastore_func.dart';
import 'quiz_questions.dart';
import 'quiz_trueorfalse.dart';

InkWell quizGridTile(
    {required ontap, required icondata, required title, required color}) {
  return InkWell(
    borderRadius: curved,
    onTap: ontap,
    child: Container(
      width: 120,
      height: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: greyK.withOpacity(.1),
        borderRadius: curved,
        border: Border.all(
          width: 1,
          color: greyK.withOpacity(.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            size: 27,
            color: color,
          ).paddingOnly(bottom: 8),
          Text(title, style: raleway.copyWith(fontSize: 15))
        ],
      ),
    ),
  );
}

