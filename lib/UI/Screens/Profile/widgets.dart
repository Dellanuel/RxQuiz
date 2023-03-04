import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:pharm_quiz/utils/app_constants.dart';

/// Editing environment widget.
/// Carries a child used in editind required variables
Future edit(Widget child, {required context}) async => await Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: child,
        ),
      ),
      isScrollControlled: true,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );

/// read only textformfield
/// used for viewing userpersonal data without being able to edit it.
Widget textViewField(
  controller,
  icon, {
  required ontap,
  required initialVal,
  required label,
}) {
  return TextFormField(
    readOnly: true,
    onTap: ontap,
    controller: controller,
    style: poppins.copyWith(fontSize: 14),
    initialValue: initialVal,
    decoration: InputDecoration(
      suffixIcon: icon ?? const Icon(Ionicons.pencil_outline),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      label: Text(
        label,
        style: poppins.copyWith(fontWeight: FontWeight.w700),
      ),
      border: const UnderlineInputBorder(),
    ),
  ).paddingOnly(bottom: 25);
}

/// Textformfield that allows for editing of texts...
/// ...or different variable constants.
Widget textEditField(
  controller, {
  required onchanged,
  required initialVal,
  required label,
}) {
  return TextFormField(
    onChanged: onchanged,
    autofocus: true,
    style: poppins.copyWith(fontSize: 14),
    initialValue: initialVal,
    controller: controller,
    decoration: InputDecoration(
      fillColor: whiteK,
      filled: true,
      // suffixIcon: IconButton(
      //   icon: Icon(Ionicons.close),
      //   onPressed: (){},
      // ).paddingOnly(right: 5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      label: Text(
        label,
        style: poppins.copyWith(fontWeight: FontWeight.w700),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

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
ListTile recentsTile({required lottieImage, required title, required date}) {
  return ListTile(
    minLeadingWidth: 50,
    horizontalTitleGap: 5,
    tileColor: greyK.withOpacity(.3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    leading: Lottie.asset(lottieImage),
    title: Text(title, style: poppins),
    subtitle: Text(date, style: bolo),
  );
}

// profile score board
Container profileScoreBoard() {
  return Container(
    height: 150,
    margin: const EdgeInsets.fromLTRB(5, 15, 5, 25),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: deepSeaBlueK),
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
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
    minLeadingWidth: 50,
    horizontalTitleGap: 10,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(width: 1, color: greyK.withOpacity(.3))),
    leading: Icon(icon, color: Get.theme.primaryColor),
    title: Text(title, style: poppins),
  ).paddingOnly(bottom: 10);
}
///End of settings widgets 