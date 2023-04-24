import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/quiz_create.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../Functions/datastore_func.dart';

class QuestionAndAnswer extends StatefulWidget {
  const QuestionAndAnswer({super.key});

  @override
  State<QuestionAndAnswer> createState() => _QuestionAndAnswerState();
}

List<Questions> _listQA = [];

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  ///boolean variables
  bool _isEditing = false;

  ///TextEditingControllers for modifiying and adding texts in the Form pile.
  String? _question,
      _correctOption,
      _inCorrectOption_1,
      _inCorrectOption_2,
      _inCorrectOption_3;

  ///A Global Key specific to only this Form Page.
  final _questionformKey = GlobalKey<FormState>();

  ///removes question from the Form pile
  ///NOTE...Questions are not yet saved to database!
  void _removeQuestion({required index}) async {
    await Get.closeCurrentSnackbar();
    _listQA.remove(_listQA[index]);
    Get.back();
    Get.showSnackbar(const GetSnackBar(
      duration: Duration(seconds: 3),
      message: 'REMOVED',
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
    ));
  }

  ///adds additional questions to the Form pile.
  ///  ///NOTE...Questions are not yet saved to database!
  void _addQuestion() {
    _listQA.add(
      Questions(
        question: _question!.capitalizeFirst,
        correctAnswer: _correctOption!.capitalizeFirst,
        incorrectAnswer1: _inCorrectOption_1!.capitalizeFirst!,
        incorrectAnswer2: _inCorrectOption_2!.capitalizeFirst!,
        incorrectAnswer3: _inCorrectOption_3!.capitalizeFirst!,
        isTrueFalse: false,
      ),
    );
  }

  // late Questions _fillvalue;
  void _editQuestion({required index}) {
    // _fillvalue = _listQA[index];
    _question = _listQA[index].question!;
    _correctOption = _listQA[index].correctAnswer!;
    _inCorrectOption_1 = _listQA[index].incorrectAnswer1;
    _inCorrectOption_2 = _listQA[index].incorrectAnswer2;
    _inCorrectOption_3 = _listQA[index].incorrectAnswer3;
    _isEditing = true;
    Get.back();
    _listQA.remove(_listQA[index]);
    setState(() {});
  }

  _clear() {}

  @override
  void initState() {
    super.initState();
    _listQA.addAllIf(quizQuestions.isNotEmpty, quizQuestions);
  }

  @override
  void dispose() {
    super.dispose();
    _listQA.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appbarBackButton2(action: () {
          Get.back();
        }),
        actions: [
          appbarButton(
              icon: Icon(
                Icons.save,
                color: Get.theme.primaryColor,
              ),
              onpressed: () {
                quizQuestions.clear();
                quizQuestions.addAll(_listQA);
                Get.back();
              })
        ],
        title: Text(
          'Question and answer ',
          style: bigBolo,
        ),
      ),
      body: Form(
        key: _questionformKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Row(
                  children: List.generate(
                      _listQA.length,
                      (index) => showQuestion(index, [
                            appbarButton(
                              icon: const Icon(
                                Icons.edit_document,
                              ),
                              onpressed: () => _editQuestion(index: index),
                            ),
                            appbarButton(
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Colors.red,
                                ),
                                onpressed: () {
                                  _removeQuestion(index: index);
                                  setState(() {});
                                })
                          ]).marginOnly(right: 5)).reversed.toList(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add question',
                    style: bigBolo.copyWith(fontSize: 15),
                  ),
                  Text(
                    'Compose your question and options in the spaces provided.',
                    style: abeezee.copyWith(color: greyK),
                  ).paddingOnly(bottom: 15),
                  textEditField(
                      initialval: _question,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Required';
                        } else {
                          return null;
                        }
                      },
                      controller: (val) => _question = val,
                      hint: 'Tap to add question',
                      label: '',
                      tF: false,
                      trailTap: null,
                      value: null),
                  textEditField(
                    initialval: _correctOption,
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
                    controller: (_) => _correctOption = _,
                    label: 'Correct Option',
                    hint: 'Enter Correct Option',
                  ),
                  const Divider(
                      endIndent: 10, indent: 10, height: 25, thickness: 0.5),
                  textEditField(
                    initialval: _inCorrectOption_1,
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
                    controller: (_) => _inCorrectOption_1 = _,
                    label: 'Incorrect Options',
                    hint: 'Enter Incorrect Option',
                  ),
                  textEditField(
                    initialval: _inCorrectOption_2,
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
                    controller: (_) => _inCorrectOption_2 = _,
                    label: '',
                    hint: 'Enter Incorrect Option',
                  ),
                  textEditField(
                    initialval: _inCorrectOption_3,
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
                    controller: (_) => _inCorrectOption_3 = _,
                    label: '',
                    hint: 'Enter Incorrect Option',
                  ),
                ],
              ).paddingOnly(left: 20, right: 20, bottom: 15, top: 8)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: whiteK,
          shape: CircleBorder(
              side: BorderSide(width: 1, color: Get.theme.primaryColor)),
          onPressed: () async {
            if (_isEditing) {
              _addQuestion();

              setState(() {
                _isEditing = false;
              });
            } else {
              if (_questionformKey.currentState!.validate()) {
                await Get.closeCurrentSnackbar();
                _addQuestion();
                setState(() {});
              }
            }
          },
          child: _isEditing
              ? const Icon(Icons.edit_document)
              : const Icon(Icons.add)),
    );
  }

  Widget showQuestion(int index, actions) {
    return GestureDetector(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 180, maxHeight: 55),
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
                _listQA[index].question!,
                style: bolo.copyWith(
                    color: whiteK, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.dialog(AlertDialog(
          actions: actions,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          title: Text(
            '${(index + 1).toString()}. ${_listQA[index].question!}',
            style: raleway,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Correct Answer',
                style: raleway,
              ),
              Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                color: greyK.withOpacity(.1),
                child: Text(
                  _listQA[index].correctAnswer!,
                  style: raleway.copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
              const Divider(),
              Text(
                'Incorrect Answer',
                style: raleway,
              ),
              Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                color: greyK.withOpacity(.1),
                child: Text(
                  '1: ${_listQA[index].incorrectAnswer1}\n2: ${_listQA[index].incorrectAnswer2}\n${_listQA[index].incorrectAnswer3}',
                  style: raleway.copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
