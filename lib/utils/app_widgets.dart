import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

import 'app_constants.dart';

/// widgets for AppBars
Widget appbarButton(
    {required Widget icon, required void Function()? onpressed}) {
  return IconButton(
    splashRadius: 27,
    style: ButtonStyle(
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
