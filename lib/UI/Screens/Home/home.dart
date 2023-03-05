import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pharm_quiz/UI/Screens/Features/discover_page.dart';
import 'package:pharm_quiz/UI/Screens/Profile/profile.dart';
import 'package:pharm_quiz/utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../Profile/settings.dart';
import 'home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                icon: const Icon(Ionicons.search_outline),
              ),
              appbarButton(
                onpressed: () {},
                icon: const Icon(Ionicons.notifications_outline),
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
                        Ionicons.chevron_forward_outline,
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
            child: discoverQuiz(),
          ),
          SliverToBoxAdapter(
            child: trendingWidget(),
          ),
        ],
      ),
    );
  }
}
