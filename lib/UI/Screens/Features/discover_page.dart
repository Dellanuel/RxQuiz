import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_quiz/UI/Screens/User/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../Functions/user_func.dart';
import '../../../utils/slivers.dart';
import '../Home/home_widgets.dart';
import '../../../Functions/datastore_func.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton(),
        title: Text(
          'Discover',
          style: bigBolo,
        ),
        actions: [
          appbarButton(
            onpressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder(
          future: DatabaseHelper().getQuestionCollections(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data!.length,
                    (index) => quizTile(
                      img: data[index].fieldImage?? 'assets/image/ico_1.png',
                      title: data[index].name!,
                      authorsname: data[index].authorsname!,
                      course: data[index].course!,
                      date: data[index].dateModified,
                      plays: data[index].plays.toString(),
                    ).paddingOnly(bottom: 10),
                  ),
                ),
              );
            } else {
              return listTileShimmer();
            }
          }),
    );
  }
}
