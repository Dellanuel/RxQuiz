import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pharm_quiz/UI/Screens/Home/home_widgets.dart';
import 'package:pharm_quiz/UI/Screens/Profile/settings.dart';
import 'package:pharm_quiz/UI/Screens/Profile/statistics.dart';
import 'package:pharm_quiz/UI/Screens/Profile/user_info.dart';
import 'package:pharm_quiz/utils/app_constants.dart';
import 'package:pharm_quiz/utils/app_widgets.dart';
import '../../../utils/dummy_data.dart';
import 'widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<bool> isselected = [true, false, false];
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
      body: Column(
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
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
          profileScoreBoard().paddingSymmetric(horizontal: 20),
          Text(
            'Libary',
            style: bolo.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
          ).paddingOnly(bottom: 10, left: 18),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   padding: const EdgeInsets.only(left: 15),
          //   physics: const BouncingScrollPhysics(),
          //   child: Row(
          //     children: [textButton(
          //               function: (){},
          //               title: '',
          //             ).marginOnly(left: 7)],
          //   ).paddingOnly(bottom: 20),
          // ),
          /// DID NOT REMOVE BECUASE I WILL NEED IT IN THE FUTURE.
          /// A TABBAR CONTROLLER FOR SWITCHING PAGES.
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
              renderBorder: true,
              borderWidth: 1,
              borderColor: Get.theme.primaryColor,
              color: blackK,
              selectedBorderColor: Get.theme.primaryColor,
              borderRadius: BorderRadius.circular(14),
              fillColor: Get.theme.primaryColor,
              selectedColor: whiteK,
              isSelected: isselected,
              children: [
                const Text(
                  'Created',
                ).paddingSymmetric(horizontal: 10),
                const Text(
                  'History',
                ).paddingSymmetric(horizontal: 10),
                const Text(
                  'Favorites',
                ).paddingSymmetric(horizontal: 10),
              ],
            ),
          ).marginOnly(bottom: 15),
          Expanded(
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
                          questionNum: quizModelData[index].questionnumber,
                          color: quizModelData[index].color,
                          authorsname: quizModelData[index].authorsname,
                          course: quizModelData[index].course,
                          plays: quizModelData[index].playsNum,
                          lottieImage: quizModelData[index].fieldImage,
                          date: quizModelData[index].date,
                          title: quizModelData[index].course,
                        );
                      },
                    )),
                  ),
                ),
                Material(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                        children: List.generate(
                      quizModelData.length,
                      (index) {
                        return quizTile(
                          questionNum: quizModelData[index].questionnumber,
                          color: quizModelData[index].color,
                          authorsname: quizModelData[index].authorsname,
                          course: quizModelData[index].course,
                          plays: quizModelData[index].playsNum,
                          lottieImage: quizModelData[index].fieldImage,
                          date: quizModelData[index].date,
                          title: quizModelData[index].course,
                        );
                      },
                    )),
                  ),
                ),
                Material(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                        children: List.generate(
                      quizModelData.length,
                      (index) {
                        return quizTile(
                          questionNum: quizModelData[index].questionnumber,
                          color: quizModelData[index].color,
                          authorsname: quizModelData[index].authorsname,
                          course: quizModelData[index].course,
                          plays: quizModelData[index].playsNum,
                          lottieImage: quizModelData[index].fieldImage,
                          date: quizModelData[index].date,
                          title: quizModelData[index].course,
                        );
                      },
                    )),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 20, vertical: 20),
          ),
        ],
      ),
    );
  }
}
