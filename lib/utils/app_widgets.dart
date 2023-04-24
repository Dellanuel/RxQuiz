import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../UI/strings.dart';
import 'app_constants.dart';

/// widgets for AppBars
Widget appbarButton(
    {required Widget icon, required void Function()? onpressed}) {
  return IconButton(
    splashRadius: 25,
    style: ButtonStyle(
      padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
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
    icon: const Icon(Icons.chevron_left),
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
    icon: const Icon(Icons.close),
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
  required void Function(String)? controller,
  required String label,
  required hint,
  required validator,
  required tF,
  required initialval,
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
            ).paddingOnly(bottom: 7),
      Container(
        decoration: BoxDecoration(
            borderRadius: curved,
            border: Border.all(width: 1, color: Get.theme.primaryColor)),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CupertinoTextFormFieldRow(
                placeholder: hint,
                maxLines: 2,
                minLines: 1,
                initialValue: initialval,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: poppins.copyWith(
                    color: !Get.isDarkMode ? null : Colors.white),
                textInputAction: TextInputAction.next,
                validator: validator,
                onChanged: controller,
              ),
            ),
            tF
                ? Checkbox(
                    side: BorderSide(color: Get.theme.primaryColor),
                    value: value,
                    splashRadius: 15,
                    onChanged: trailTap,
                    shape: const CircleBorder(),
                  )
                : Container()
          ],
        ),
      ),
    ],
  ).paddingOnly(bottom: tF ? 0 : 15);
}

Widget dropDownButton({
  required BuildContext context,
  required String hintText,
  required List<String> items,
  required String? selectedValue,
  required onChanged,
  required textEditingController,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: curved,
        border: Border.all(width: 1, color: Get.theme.primaryColor)),
    child: CupertinoFormRow(
      child: DropdownButton2(
        isExpanded: true, searchInnerWidgetHeight: 70,
        style: raleway.copyWith(fontSize: 16, color: blackK),
        hint: Text(
          hintText,
          style: bolo.copyWith(fontSize: 16, color: greyK),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        isDense: true, icon: Container(),
        underline: Container(),
        onChanged: onChanged,
        buttonHeight: 50,
        buttonWidth: double.infinity,
        itemHeight: 50,
        dropdownMaxHeight: 600,
        searchController: textEditingController,
        searchInnerWidget: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: 'Search for a course...',
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) {
          return (item.value.toString().contains(searchValue));
        },
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    ),
  );
}
