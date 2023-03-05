import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:pharm_quiz/utils/app_constants.dart';
/// button used for app functions
Widget elevatedButton({required text, required onpressed}) {
  return ElevatedButton(
      style: textButtonStyl,
      onPressed: onpressed,
      child: Text(
        text,
        style: poppins.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ));
}

/// recents tile
Widget quizTile({
  required Color? color,
  required lottieImage,
  required title,
  required questionNum,
  required authorsname,
  required course,
  required date,
  required plays,
}) {
  return ListTile(
    onTap: () {},
    dense: true,
    minVerticalPadding: 0,
    minLeadingWidth: 70,
    tileColor: color!.withOpacity(.3),
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1, color: greyK.withOpacity(.5)),
      borderRadius: curved,
    ),
    contentPadding: const EdgeInsets.all(0),
    leading: SizedBox(
      height: 70,
      width: 70,
      child: Center(
        child: Lottie.asset(
          lottieImage,
          repeat: false,
          fit: BoxFit.fill,
          height: 100,
        ),
      ),
    ),
    title: Container(
      height: 100,
      decoration: BoxDecoration(
        color: whiteK,
        borderRadius: curved,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: montserrat.copyWith(
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(flex: 1),
          Text(
            '$course.Q$questionNum',
            style: abeezee.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '$date. ${plays}plays',
            style: raleway.copyWith(
              fontSize: 11,
              color: blackK.withOpacity(.8),
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
                '$authorsname.',
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
  ).paddingOnly(bottom: 15);
}

// profile score board
Container profileScoreBoard() {
  return Container(
    height: 150,
    margin: const EdgeInsets.fromLTRB(5, 15, 5, 25),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(borderRadius: curved, color: deepSeaBlueK),
    child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '100',
                        style: poppins.copyWith(color: whiteK),
                      ),
                      Text(
                        'LiveQuiz',
                        style: abeezee.copyWith(color: whiteK),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider().paddingSymmetric(horizontal: 20),
                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '100',
                        style: poppins.copyWith(color: whiteK),
                      ),
                      Text(
                        'RxQuiz',
                        style: abeezee.copyWith(color: whiteK),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 2,
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '9',
                        style: poppins.copyWith(color: whiteK),
                      ),
                      Text(
                        'Rooms',
                        style: abeezee.copyWith(color: whiteK),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider().paddingSymmetric(horizontal: 20),
                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '5',
                        style: poppins.copyWith(color: whiteK),
                      ),
                      Text(
                        'created',
                        style: abeezee.copyWith(color: whiteK),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
  );
}

///The following widgets are used in the page of the app SETTINGS
///TILE
Widget settingsTile(trailing,
    {required icon, required title, required Color? color, required ontap}) {
  return ListTile(
    onTap: ontap,
    contentPadding: const EdgeInsets.all(5),
    shape: RoundedRectangleBorder(borderRadius: curved),
    leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
            shape: const CircleBorder(), color: color!.withOpacity(.1)),
        child: Icon(icon, color: color)),
    title: Text(title, style: poppins),
    trailing: trailing ?? const Icon(Ionicons.chevron_forward),
  );
}

///HELP CENTER TILE
Widget helpCenterTile(trailing,
    {required icon, required title, required ontap}) {
  return ListTile(
    onTap: ontap,
    minLeadingWidth: 30,
    horizontalTitleGap: 10,
    shape: RoundedRectangleBorder(
        borderRadius: curved,
        side: BorderSide(width: 1, color: greyK.withOpacity(.3))),
    leading: Icon(icon, color: Get.theme.primaryColor),
    title: Text(title, style: poppins),
  ).paddingOnly(bottom: 10);
}

///End of settings widgets
///
///STATISTICS WIDGETS
Widget achievementTile({required leading, required title, required subtitle}) {
  return ListTile(
    dense: true,
    minLeadingWidth: 30,
    horizontalTitleGap: 5,
    contentPadding: EdgeInsets.symmetric(horizontal: 8),
    shape: RoundedRectangleBorder(
        borderRadius: curved,
        side: BorderSide(width: 1, color: greyK.withOpacity(.3))),
    leading: leading,
    title:
        Text(title, style: poppins.copyWith(overflow: TextOverflow.ellipsis)),
    subtitle: Text(subtitle,
        style: abeezee.copyWith(
            overflow: TextOverflow.ellipsis, color: greyK, fontSize: 11)),
  ).paddingOnly(bottom: 10);
}
