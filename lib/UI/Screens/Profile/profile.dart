import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pharm_quiz/UI/Screens/Home/home_widgets.dart';
import 'package:pharm_quiz/UI/Screens/Profile/settings.dart';
import 'package:pharm_quiz/UI/Screens/Profile/statistics.dart';
import 'package:pharm_quiz/UI/Screens/Profile/user_info.dart';
import 'package:pharm_quiz/utils/app_constants.dart';
import 'package:pharm_quiz/utils/app_widgets.dart';
import 'widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<bool> isselected = [true, false];
  final _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton(),
        title: Text(
          'Profile',
          style: bigBolo,
        ),
        actions: [
          appbarButton(
            onpressed: () {
              Get.to(() => const Statistics());
            },
            icon: const Icon(Ionicons.stats_chart_outline),
          ),
          appbarButton(
            onpressed: () {
              Get.to(() => const SettingsPage());
            },
            icon: const Icon(Ionicons.settings_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.only(left: 8),
              title: Text(
                'UserName',
                style: robotoSlab.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'useremail@useremail.com',
                style: bolo.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: elevatedButton(
                  text: 'Edit profile',
                  onpressed: () {
                    Get.to(() => const UserInfo());
                  }),
            ),
            profileScoreBoard(),
            Text(
              'Personal Libary',
              style: bolo.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ).paddingOnly(bottom: 10, left: 8),
            Center(
              child: ToggleButtons(
                onPressed: (newIndex) {
                  setState(() {
                    for (int index = 0; index < isselected.length; index++) {
                      if (index == newIndex) {
                        isselected[index] = true;
                        _pageController.animateToPage(index,
                            curve: Curves.linearToEaseOut,
                            duration: const Duration(
                              milliseconds: 600,
                            ));
                      } else {
                        isselected[index] = false;
                      }
                    }
                  });
                },
                textStyle: poppins,
                borderWidth: 2,
                color: blackK,
                borderColor: Get.theme.primaryColor,
                selectedBorderColor: Get.theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
                fillColor: Get.theme.primaryColor,
                selectedColor: whiteK,
                isSelected: isselected,
                children: [
                  const Text(
                    'Created',
                  ).paddingSymmetric(horizontal: 30),
                  const Text(
                    'History',
                  ).paddingSymmetric(horizontal: 30),
                ],
              ),
            ).marginOnly(bottom: 15),
            SizedBox(
              height: 300,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                children: [
                  Material(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                          children: List.generate(
                        quizModelData.length,
                        (index) {
                          return quizTile(
                            questionNum: '10',
                            color: quizModelData[index].color,
                            authorsname: quizModelData[index].authorsname,
                            course: quizModelData[index].course,
                            plays: '5',
                            lottieImage: quizModelData[index].fieldImage,
                            date: 'now',
                            title: quizModelData[index].course,
                          );
                        },
                      )),
                    ),
                  ),
                  Material(
                    child: Column(
                        children: List.generate(
                      quizModelData.length,
                      (index) {
                        return quizTile(
                          questionNum: '10',
                          color: quizModelData[index].color,
                          authorsname: quizModelData[index].authorsname,
                          course: quizModelData[index].course,
                          plays: '5',
                          lottieImage: quizModelData[index].fieldImage,
                          date: 'now',
                          title: quizModelData[index].course,
                        );
                      },
                    )),
                  ),
                ],
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 15, vertical: 20),
      ),
    );
  }
}
