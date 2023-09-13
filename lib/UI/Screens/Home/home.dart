import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_quiz/UI/Screens/Features/discover_page.dart';
import 'package:pharm_quiz/UI/Screens/User/notification.dart';
import 'package:pharm_quiz/UI/Screens/User/profile.dart';
import 'package:pharm_quiz/utils/app_constants.dart';
import '../../../Functions/datastore_func.dart';
import '../../../utils/app_widgets.dart';
import '../../../utils/slivers.dart';
import 'home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(minutes: 1), (timer) async {
      await DatabaseHelper().getQuestionCollections();
      setState(() {});
    });
  }

  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            titleSpacing: 0,
            centerTitle: false,
            title: Container(
              margin: const EdgeInsets.all(5),
              child: ListTile(
                onTap: () {
                  Get.to(() => const Profile());
                },
                minLeadingWidth: 40,
                contentPadding: const EdgeInsets.all(8),
                horizontalTitleGap: 10,
                leading: const CircleAvatar(
                  child: Center(child: Icon(Icons.person_outline_rounded)),
                ),
                title: Text(
                  'UserName',
                  style: robotoSlab.copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: blackK,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            actions: [
              appbarButton(
                onpressed: () {},
                icon: const Icon(Icons.search),
              ),
              appbarButton(
                onpressed: () {
                  Get.to(() => AppNotification());
                },
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: dashBoard(),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    featuresWidgetData.length,
                    (index) => textButton(
                          function: featuresWidgetData[index].function,
                          title: featuresWidgetData[index].name!,
                        ).marginOnly(left: 7)),
              ).paddingOnly(bottom: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  'Discover',
                  style:
                      bolo.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Spacer(),
                InkWell(
                  borderRadius: curved,
                  onTap: () {
                    Get.to(() => const Discover());
                  },
                  child: Row(
                    children: [
                      Text(
                        'more',
                        style: raleway.copyWith(color: Get.theme.primaryColor),
                      ),
                      Icon(
                        Icons.chevron_left,
                        size: 15,
                        color: Get.theme.primaryColor,
                      )
                    ],
                  ).paddingSymmetric(horizontal: 5, vertical: 2),
                ),
              ],
            ).paddingSymmetric(horizontal: 22),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: curved,
              child: FutureBuilder<List<QuizModel>>(
                  future: DatabaseHelper().getQuestionCollections(),
                  builder: (context, snapshot) {
                final data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 208,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 15),
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => gridTileShimmer().paddingOnly(right: 15),
                        ),
                      ),
                    ),
                  );
                } else {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return discoverQuiz(data: data!, dataLength: data.length);
                  } else {
                    return Container(
                      height: 208,
                      color: greyK.withOpacity(.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline_rounded,
                              size: 30, color: greyK),
                          const SizedBox(height: 10),
                          Text(
                            'No available Data',
                            style: bolo.copyWith(fontSize: 20, color: greyK),
                          )
                        ],
                      ),
                    );
                  }
                }
              }),
            ),
          ),
          SliverToBoxAdapter(
            child: trendingWidget(),
          ),
        ],
      ),
    );
  }
}
