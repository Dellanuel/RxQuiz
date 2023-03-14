import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/quiz_questions.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import 'model.dart';
import 'quiz_trueorfalse.dart';
import 'widget.dart';

class CreateQZ extends StatefulWidget {
  const CreateQZ({super.key});

  @override
  State<CreateQZ> createState() => _CreateQZState();
}

List<Questions> quizQuestions = [];

class _CreateQZState extends State<CreateQZ> {
  final _formKey = GlobalKey<FormState>();
  final _quiztitleControl = TextEditingController();
  final _quizDecriptionControl = TextEditingController();
  String theme = '';
  String course = '';
  bool _tF = false;
  final _whiteButton =
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(whiteK));

  _saveQuiz() {
    QuizModel().toMap(QuizModel(
      name: _quiztitleControl.text,
      theme: theme,
      course: course,
      questions: quizQuestions,
      trueFalse: _tF,
      description: _quizDecriptionControl.text,
      favorited: 0,
      plays: 0,
      dateModified:
          '${DateTime.now().month.toString()}-${DateTime.now().day.toString()}-${DateTime.now().year.toString()}',
    ));
    Get.showSnackbar(const GetSnackBar(
      // title: 'Error',
      duration: Duration(seconds: 4),
      message: 'Successfully added',
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    quizQuestions.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton2(action: () {
          Get.back();
          _tF = false;
        }),
        title: Text(
          'Create Quiz',
          style: bigBolo,
        ),
        actions: [
          appbarButton(
              icon: Icon(
                Ionicons.save_outline,
                color: Get.theme.primaryColor,
              ),
              onpressed: () {
                _saveQuiz();
              }),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: curved,
                    border:
                        Border.all(width: 1, color: Get.theme.primaryColor)),
              ).paddingOnly(bottom: 15),
              textEditField(
                  value: null,
                  trailTap: null,
                  tF: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Required';
                    } else {
                      return null;
                    }
                  },
                  controller: _quiztitleControl,
                  hint: 'Enter title',
                  label: 'Title'),
              textEditField(
                  value: null,
                  trailTap: null,
                  tF: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Required';
                    } else {
                      return null;
                    }
                  },
                  controller: _quizDecriptionControl,
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
              quizQuestions.isEmpty
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Questions',
                          style: poppins.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(flex: 2),
                        appbarButton(
                            icon: const Icon(
                              Ionicons.add,
                            ),
                            onpressed: () async {
                              await Get.to(() => _tF
                                      ? const TrueOrFalse()
                                      : const QuestionAndAnswer())!
                                  .whenComplete(() {
                                setState(() {});
                              });
                            }),

                        ///Button for additional or editing added questions.
                        appbarButton(
                            icon: const Icon(
                              Ionicons.trash_outline,
                              color: Colors.red,
                            ),
                            onpressed: () {
                              Get.dialog(_showDelete());
                            }),

                        ///Button for deleting all added questions
                      ],
                    ).paddingOnly(bottom: 10),
              Column(
                children: List.generate(
                    quizQuestions.length, (index) => showQuestions(index)),
              ),
              SizedBox(height: quizQuestions.isEmpty ? 0 : 40)
            ],
          ),
        ),
      ),
      floatingActionButton: quizQuestions.isNotEmpty
          ? Container()
          : ElevatedButton(
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
                                  ontap: () {
                                    Get.to(() => const QuestionAndAnswer(),
                                            transition: Transition.downToUp)!
                                        .whenComplete(() {
                                      _tF = false;
                                      setState(() {});
                                      Get.back();
                                    });
                                  },
                                  icondata: CupertinoIcons.doc_plaintext,
                                  title: 'Quiz',
                                  color: Get.theme.primaryColor,
                                ),

                                ///For adding initial questions!
                                quizGridTile(
                                  ontap: () async {
                                    _tF = true;
                                    await Get.to(() => const TrueOrFalse(),
                                            transition: Transition.downToUp)!
                                        .whenComplete(() {
                                      quizQuestions.isEmpty
                                          ? _tF = false
                                          : _tF = true;

                                      setState(() {});
                                      Get.back();
                                    });
                                  },
                                  icondata:
                                      CupertinoIcons.game_controller_solid,
                                  title: 'True or False',
                                  color: Colors.orange,
                                ),

                                ///For adding initial questions!
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

  AlertDialog _showDelete() {
    return AlertDialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      actions: [
        TextButton(
            style: _whiteButton,
            onPressed: () {
              Get.back();
            },
            child: Text('no', style: poppins)),
        TextButton(
            style: _whiteButton,
            onPressed: () {
              quizQuestions.clear();
              _tF = false;
              Get.back();
              setState(() {});
            },
            child: Text('yes', style: poppins)),
      ],
      title: Row(
        children: [
          const Icon(
            Ionicons.trash_outline,
            color: Colors.red,
          ).marginOnly(right: 10),
          Expanded(
            child: Text(
              'Delete all questions?',
              style: bolo,
            ),
          ),
        ],
      ),
    );
  }

  // AlertDialog _showAdd() {
  //   return AlertDialog(
  //     insetPadding:
  //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
  //     actions: [
  //       TextButton(
  //           style: _whiteButton,
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child: Text('cancel', style: poppins)),
  //       TextButton(
  //           style: _whiteButton,
  //           onPressed: () {
  //             // _quizQuestions.clear();
  //             Get.back();
  //             setState(() {});
  //           },
  //           child: Text('add', style: poppins)),
  //     ],
  //     title: Text(
  //       'Add question',
  //       style: bigBolo,
  //     ),
  //   );
  // }
  showQuestions(int index) {
    return GestureDetector(
      onTap: () {
        print(quizQuestions);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        constraints: const BoxConstraints(maxHeight: 55),
        decoration: BoxDecoration(
          borderRadius: curved,
          color: deepSeaBlueK,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              decoration:
                  ShapeDecoration(color: whiteK, shape: const CircleBorder()),
              child: Text(
                (index + 1).toString(),
                style: bolo.copyWith(
                    color: blackK, overflow: TextOverflow.ellipsis),
              ),
            ),
            Expanded(
              child: Text(
                quizQuestions[index].question!,
                style: bolo.copyWith(
                    color: whiteK, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   showTF(int index) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       constraints: const BoxConstraints(maxHeight: 55),
//       decoration: BoxDecoration(
//         borderRadius: curved,
//         color: deepSeaBlueK,
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.only(right: 10),
//             decoration:
//                 ShapeDecoration(color: whiteK, shape: const CircleBorder()),
//             child: Text(
//               (index + 1).toString(),
//               style:
//                   bolo.copyWith(color: blackK, overflow: TextOverflow.ellipsis),
//             ),
//           ),
//           Expanded(
//               child: Text(
//             quizQuestions[index].tFquestion!,
//             style:
//                 bolo.copyWith(color: whiteK, overflow: TextOverflow.ellipsis),
//           )),
//         ],
//       ),
//     );
//   }
// }
