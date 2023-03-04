import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import 'user_info.dart';
import 'widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _toggle = false;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  List<String> selectedItems = [];
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: '08154435160',
    queryParameters: <String, String>{
      'body': Uri.encodeComponent('Hi i have an issue.'),
    },
  );
  final Uri telLaunchUri = Uri(
    scheme: 'tel',
    path: '08154435160',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton(),
        title: Text(
          'Settings',
          style: bigBolo,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          Center(child: appLogo()).paddingOnly(bottom: 30),
          settingsTile(
            null,
            ontap: () {
              Get.to(() => const UserInfo());
            },
            color: Colors.orange,
            icon: Ionicons.person_outline,
            title: 'Personal Info',
          ).paddingOnly(bottom: 10),
          notificationButton().paddingOnly(bottom: 10),
          settingsTile(
              icon: Ionicons.moon_outline,
              title: 'Dark Mode',
              color: Colors.blue[900],
              ontap: null,
              CupertinoSwitch(
                  activeColor: Get.theme.primaryColor,
                  value: _toggle,
                  onChanged: (val) {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  })).paddingOnly(bottom: 10),
          settingsTile(
            null,
            ontap: () {
              Get.dialog(
                alertBox(
                  title: 'Contact Us',
                  children: [
                    helpCenterTile(
                      null,
                      icon: Ionicons.call_outline,
                      title: 'Customer Service',
                      ontap: () {
                        launchUrl(telLaunchUri);
                      },
                    ),
                    helpCenterTile(
                      null,
                      icon: Ionicons.chatbubble_ellipses_outline,
                      title: 'Send an sms',
                      ontap: () {
                        launchUrl(smsLaunchUri);
                      },
                    ),
                    helpCenterTile(
                      null,
                      icon: Ionicons.logo_whatsapp,
                      title: 'WhatsApp',
                      ontap: () {},
                    ),
                    helpCenterTile(
                      null,
                      icon: Ionicons.mail_outline,
                      title: 'Email',
                      ontap: () {
                        launchUrl(Uri(
                          scheme: 'mailto',
                          path: 'chinemelue1@gmail.com',
                          query: encodeQueryParameters(<String, String>{
                            'subject': 'RxQuiz client request',
                          }),
                        ));
                      },
                    ),
                  ],
                ),
              );
            },
            color: Colors.purple,
            icon: Ionicons.file_tray,
            title: 'Help Center',
          ).paddingOnly(bottom: 10),
          settingsTile(
            null,
            ontap: () {},
            color: Colors.green,
            icon: Ionicons.information_outline,
            title: 'About',
          ).paddingOnly(bottom: 10),
          settingsTile(
            null,
            ontap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('You want to log out?',
                            style: bigBolo.copyWith(color: Colors.redAccent))
                        .paddingOnly(bottom: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        elevatedButton(
                            text: 'No don\'t',
                            onpressed: () {
                              Get.back();
                            }),
                        elevatedButton(text: 'Yes Logout', onpressed: () {})
                            .paddingOnly(left: 10)
                      ],
                    )
                  ],
                ).paddingSymmetric(horizontal: 30, vertical: 30),
              );
            },
            color: Colors.red,
            icon: Ionicons.information_outline,
            title: 'Logout',
          ).paddingOnly(bottom: 10),
        ],
      ),
    );
  }

  AlertDialog alertBox({required title, required children}) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      title: Text(title, style: bigBolo),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  Widget notificationButton() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    setState(() {});
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        isSelected
                            ? const Icon(
                                Ionicons.radio_button_off_outline,
                              )
                            : Icon(
                                Ionicons.radio_button_on_outline,
                                color: Get.theme.primaryColor,
                              ),
                        const SizedBox(width: 16),
                        Text(item, style: abeezee),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        onChanged: (value) {},
        buttonHeight: 40,
        buttonWidth: 140,
        itemHeight: 40,
        itemPadding: EdgeInsets.zero,
        isExpanded: true,
        focusColor: Get.theme.canvasColor,
        customButton: settingsTile(
          null,
          ontap: null,
          color: Colors.pink,
          icon: Ionicons.notifications_outline,
          title: 'Notification',
        ),
        buttonDecoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
