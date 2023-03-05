import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pharm_quiz/UI/Screens/Profile/widgets.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';

class CreateQZ extends StatefulWidget {
  const CreateQZ({super.key});

  @override
  State<CreateQZ> createState() => _CreateQZState();
}

class _CreateQZState extends State<CreateQZ> {
  final titleControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton(),
        title: Text(
          'Create Quiz',
          style: bigBolo,
        ),
        actions: [
          appbarButton(
            onpressed: () {},
            icon: const Icon(Ionicons.help_circle_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: curved,
                  border: Border.all(width: 1, color: Get.theme.primaryColor)),
            ).paddingOnly(bottom: 15),
            textEditField(
                controller: titleControl, hint: 'Enter title', label: 'Title'),
            textEditField(
                controller: titleControl,
                hint: 'Enter Description',
                label: 'Description'),
            textViewField(
                icon: const Icon(Ionicons.chevron_down_outline),
                ontap: () {},
                initialVal: null,
                controller: null,
                hint: 'Select Course',
                label: 'Course'),
            textViewField(
                icon: Icon(Ionicons.color_palette_outline,
                    color: Get.theme.primaryColor),
                ontap: () {},
                initialVal: null,
                controller: null,
                hint: 'Color Theme',
                label: 'Theme'),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: textButtonStyl,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Question Format',
                          style: bigBolo,
                        ),
                        const Divider(
                          height: 30,
                          endIndent: 10,
                          indent: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            quizGridTile(
                              ontap: () {},
                              icondata: CupertinoIcons.doc_plaintext,
                              title: 'Quiz',
                              color: Get.theme.primaryColor,
                            ),
                            quizGridTile(
                              ontap: () {},
                              icondata: CupertinoIcons.game_controller_solid,
                              title: 'True or False',
                              color: Colors.orange,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Text(
            'Add Questions',
            style: poppins.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ).paddingSymmetric(horizontal: 20, vertical: 15)),
    );
  }

  InkWell quizGridTile(
      {required ontap, required icondata, required title, required color}) {
    return InkWell(
      borderRadius: curved,
      onTap: ontap,
      child: Container(
        width: 120,
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: greyK.withOpacity(.1),
          borderRadius: curved,
          border: Border.all(
            width: 1,
            color: greyK.withOpacity(.3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icondata,
              size: 27,
              color: color,
            ).paddingOnly(bottom: 8),
            Text(title, style: raleway.copyWith(fontSize: 15))
          ],
        ),
      ),
    );
  }
}
