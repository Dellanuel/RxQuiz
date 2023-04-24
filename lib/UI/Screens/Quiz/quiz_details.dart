import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/play_quiz.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../Functions/user_func.dart';
import '../../strings.dart';
import '../../../Functions/datastore_func.dart';

class QuizDetails extends StatefulWidget {
  const QuizDetails({super.key, required this.index, required this.data});
  final int index;
  final data;
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
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                // color: Colors.grey[300],
                borderRadius: curved,
              ),
              child: Center(
                child: Image.asset(
                    widget.data[widget.index].fieldImage ??
                        'assets/image/ico_1.png',
                    fit: BoxFit.fill,
                    height: 150),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(widget.data[widget.index].name!, style: bigBolo)
                      .paddingOnly(top: 15),
                ),
                Text(
                  widget.data[widget.index].dateModified!
                      .toDate()
                      .millisecondsSinceEpoch
                      .toString(),
                  style: abeezee.copyWith(color: greyK),
                ).paddingOnly(top: 15),
              ],
            ),
            Text(widget.data[widget.index].course!,
                style: poppins.copyWith(color: greyK)),
            const Divider(height: 20, endIndent: 5, indent: 5),
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
                        '122',
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
                        widget.data[widget.index].plays.toString(),
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
                        widget.data[widget.index].favorited.toString(),
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
            const Divider(height: 20, endIndent: 5, indent: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 20,
                ).paddingOnly(right: 10),
                Expanded(
                  child: ListTile(
                    minVerticalPadding: 0,
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    title: Text(
                      widget.data[widget.index].authorsname!,
                      style: robotoSlab.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      widget.data[widget.index].authorsemail!,
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
              widget.data[widget.index].description!,
              style: abeezee,
            ).paddingOnly(top: 8),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: textButtonStyl,
        onPressed: () {
          Get.to(() => PlayQuiz(index: widget.index));
        },
        child: Text(
          'Let\'s begin',
          style: poppins.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ).paddingSymmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
