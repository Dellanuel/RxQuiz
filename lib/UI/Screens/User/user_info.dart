import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import 'widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  String firstname = 'Chinemelu';

  String lastname = 'Aniebo';

  String email = 'chinemelu@gmail.com';

  Rx<TextEditingController> dOB = TextEditingController(text: '06-11-2002').obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton(),
        title: Text(
          'Personal Info',
          style: bigBolo,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        children: [
          Center(
            child: SizedBox(
              height: 110,
              width: 110,
              child: Stack(
                children: [
                  const CircleAvatar(radius: 50),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: elevatedButton(text: 'Edit', onpressed: () {})),
                ],
              ),
            ),
          ),
          Divider(
            height: 25,
            color: greyK.withOpacity(.3),
          ).paddingOnly(bottom: 10),
          textViewField(
            icon: null,
            controller: null,
            hint: null,
            ontap: () async {
              await Get.closeCurrentSnackbar();
              Get.showSnackbar(const GetSnackBar(
                // title: 'Error',
                duration: Duration(seconds: 4),
                message: 'Cannot be edited',
                backgroundColor: Colors.deepOrange,
                snackPosition: SnackPosition.TOP,
                snackStyle: SnackStyle.GROUNDED,
              ));
            },
            initialVal: firstname,
            label: 'First Name',
          ),
          textViewField(
            controller: null,
            icon: null,
            ontap: () async {
              await Get.closeCurrentSnackbar();
              Get.showSnackbar(const GetSnackBar(
                // title: 'Error',
                duration: Duration(seconds: 4),
                message: 'Cannot be edited',
                backgroundColor: Colors.deepOrange,
                snackPosition: SnackPosition.TOP,
                snackStyle: SnackStyle.GROUNDED,
              ));
            },
            initialVal: lastname,
            label: 'Last Name',
            hint: null,
          ),
          textViewField(
            controller: null,
            icon: null,
            hint: null,
            ontap: () async {
              Get.closeAllSnackbars();
              await Get.closeCurrentSnackbar();
              Get.showSnackbar(const GetSnackBar(
                // title: 'Error',
                message: 'Cannot be edited',
                duration: Duration(seconds: 4),
                backgroundColor: Colors.deepOrange,
                snackPosition: SnackPosition.TOP,
                snackStyle: SnackStyle.GROUNDED,
              ));
            },
            initialVal: email,
            label: 'Email Address',
          ),
          Obx(
            () => textViewField(
              hint: 'Enter Date of Birth',
              label: 'Date of Birth',
              controller: dOB.value,
              icon: Icon(
                Icons.calendar_today,
                color: Get.theme.primaryColor,
              ),
              ontap: () {
                DatePicker.showDatePicker(
                  context,
                  theme: DatePickerTheme(
                      containerHeight: 200,
                      doneStyle: bolo.copyWith(fontSize: 16),
                      itemStyle: poppins,
                      cancelStyle: bolo.copyWith(fontSize: 16)),
                  showTitleActions: true,
                  minTime: DateTime(1950, 12, 31),
                  maxTime: DateTime(2020, 12, 31),
                  onConfirm: (date) {
                    dOB.value.text = '${date.year}-${date.month}-${date.day}';
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.en,
                );
              },
              initialVal: null,
            ),
          ),
        ],
      ),
    );
  }
}
