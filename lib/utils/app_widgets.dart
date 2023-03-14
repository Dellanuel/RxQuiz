import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

import '../UI/strings.dart';
import 'app_constants.dart';

/// widgets for AppBars
Widget appbarButton(
    {required Widget icon, required void Function()? onpressed}) {
  return IconButton(
    splashRadius: 25,
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
      shape: MaterialStateProperty.all(const CircleBorder()),
    ),
    icon: icon,
    onPressed: onpressed,
  ).paddingOnly(right: 5);
}

Widget appbarBackButton() {
  return IconButton(
    splashRadius: 27,
    style: ButtonStyle(
      shape: MaterialStateProperty.all(const CircleBorder()),
    ),
    icon: const Icon(Ionicons.chevron_back),
    onPressed: () {
      Get.back();
    },
  );
}

Widget appbarBackButton2({required void Function()? action}) {
  return IconButton(
    splashRadius: 27,
    style: ButtonStyle(
      shape: MaterialStateProperty.all(const CircleBorder()),
    ),
    icon: const Icon(Ionicons.close),
    onPressed: action,
  );
}

/// searchbar
final InputBorder _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: BorderSide.none,
);
Widget searchbar(
    {void Function(String)? onchanged,
    required void Function()? iconOnPressed,
    required TextEditingController? controller}) {
  return SizedBox(
    height: 50,
    child: TextFormField(
      style: bolo.copyWith(color: Colors.grey[900]),
      onChanged: onchanged,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: _border,
          disabledBorder: _border,
          enabledBorder: _border,
          errorBorder: _border,
          focusedBorder: _border,
          hintText: 'looking for?',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          suffixIcon: controller!.text.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: iconOnPressed,
                  icon: Icon(Icons.forward_rounded, color: Colors.grey[800])),
          prefixIcon: const Icon(Icons.search, color: Colors.grey)),
    ),
  );
}

///app logo
Widget appLogo() {
  return Container(
    height: 60,
    width: 80,
    margin: const EdgeInsets.all(0),
    padding: const EdgeInsets.all(5),
    decoration: ShapeDecoration(
      shape: CircleBorder(side: BorderSide(width: 2, color: whiteK)),
      color: lightSeaBlueK,
    ),
    child: Stack(
      children: [
        Center(
          child: Lottie.asset(
            'assets/Lottie/question.json',
            repeat: false,
            height: 50,
            width: 50,
          ),
        ),
        Align(
          alignment: const Alignment(1.5, 1.5),
          child: Lottie.asset(
            'assets/Lottie/bulb.json',
            repeat: true,
            height: 30,
            width: 30,
          ),
        ),
        Align(
          alignment: const Alignment(0.0, 4),
          child: Text(
            appname,
            style: bolo.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: deepSeaBlueK.withOpacity(0.7),
            ),
          ),
        ),
      ],
    ),
  ).paddingAll(5);
}

Widget textViewField({
  required icon,
  required ontap,
  required initialVal,
  required controller,
  required hint,
  required label,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: poppins.copyWith(fontWeight: FontWeight.w600),
      ),
      TextFormField(
        readOnly: true,
        onTap: ontap,
        controller: controller,
        style: poppins.copyWith(fontSize: 14),
        initialValue: initialVal,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: icon,
          border: const UnderlineInputBorder(),
        ),
      ),
    ],
  ).paddingOnly(bottom: 15);
}

/// Textformfield that allows for editing of texts...
/// ...or different variable constants.
Widget textEditField({
  required controller,
  required String label,
  required hint,
  required validator,
  required tF,
  required void Function(bool?)? trailTap,
  required bool? value,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      label.isEmpty
          ? Container()
          : Text(
              label,
              style: bolo.copyWith(fontWeight: FontWeight.w600),
            ).paddingOnly(bottom: 10),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: curved,
            border: Border.all(width: 1, color: Get.theme.primaryColor)),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                autofocus: true,
                maxLines: null,
                validator: validator,
                style: poppins.copyWith(fontSize: 14),
                controller: controller,
                decoration: InputDecoration.collapsed(
                  hintText: hint,
                ),
              ),
            ),
            tF
                ? Checkbox(
                    side: BorderSide(color: Get.theme.primaryColor),
                    value: value,
                    splashRadius: 20,
                    onChanged: trailTap,
                  )
                : Container()
          ],
        ),
      ),
    ],
  ).paddingOnly(bottom: tF ? 0 : 15);
}
