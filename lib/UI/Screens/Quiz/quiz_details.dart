import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:pharm_quiz/UI/Screens/Profile/widgets.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../utils/dummy_data.dart';
import '../../strings.dart';
import '../Home/home_widgets.dart';

class QuizDetails extends StatefulWidget {
  const QuizDetails({super.key, required this.index});
  final int index;
  @override
  State<QuizDetails> createState() => _QuizDetailsState();
}

class _QuizDetailsState extends State<QuizDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appname,
          style: bigBolo,
        ),
        leading: appbarBackButton(),
        actions: [
          appbarButton(
            onpressed: () {},
            icon: const Icon(CupertinoIcons.pencil_outline),
          ),
          appbarButton(
            onpressed: () {},
            icon: const Icon(CupertinoIcons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: quizModelData[widget.index].color!.withOpacity(.3),
                // color: Colors.grey[300],
                borderRadius: curved,
              ),
              child: Center(
                child: Lottie.asset(quizModelData[widget.index].fieldImage!,
                    fit: BoxFit.fill, height: 150),
              ),
            ),
            Text(quizModelData[widget.index].quizname!, style: bigBolo)
                .paddingOnly(top: 15),
            Text(quizModelData[widget.index].course!,
                style: poppins.copyWith(color: greyK)),
            Divider(height: 20, endIndent: 5, indent: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        quizModelData[widget.index].questionnumber!,
                        style: poppins,
                      ),
                      Text(
                        'Questions',
                        style: abeezee.copyWith(
                            fontWeight: FontWeight.w500, color: greyK),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        quizModelData[widget.index].playsNum!,
                        style: poppins,
                      ),
                      Text(
                        'Plays',
                        style: abeezee.copyWith(
                            fontWeight: FontWeight.w500, color: greyK),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        quizModelData[widget.index].favourited!,
                        style: poppins,
                      ),
                      Text(
                        'Favorited',
                        style: abeezee.copyWith(
                            fontWeight: FontWeight.w500, color: greyK),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 5),
            Divider(height: 20, endIndent: 5, indent: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                ).paddingOnly(right: 10),
                Expanded(
                  child: ListTile(
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.all(0),
                    dense: true,
                    title: Text(
                      quizModelData[widget.index].authorsname!,
                      style: robotoSlab.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      quizModelData[widget.index].authorsemail!,
                      style: bolo.copyWith(
                        color: greyK,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Description',
              style: bolo.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ).paddingOnly(top: 15),
            Text(
              quizModelData[widget.index].description!,
              style: abeezee,
            ).paddingOnly(top: 8),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: textButtonStyl,
          onPressed: () {},
          child: Text(
            'Let\'s begin',
            style: poppins.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ).paddingSymmetric(horizontal: 20, vertical: 15)),
    );
  }
}
