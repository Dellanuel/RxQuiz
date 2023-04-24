import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../Functions/datastore_func.dart';
import 'quiz_create.dart';

class TrueOrFalse extends StatefulWidget {
  const TrueOrFalse({super.key});

  @override
  State<TrueOrFalse> createState() => _TrueOrFalseState();
}

List<Questions> _listTF = [];

class _TrueOrFalseState extends State<TrueOrFalse> {
  ///boolean variable for page state.
  bool _isEditing = false;

  ///A Global Key specific to only this Form Page.
  final _trueFalseformKey = GlobalKey<FormState>();

  ///boolean variable for true or false fields.
  bool _answer1 = false;
  bool _answer2 = false;
  bool _answer3 = false;
  bool _answer4 = false;

  ///TextEditingControllers for modifiying and adding texts in the Form pile.
  String? _question, _option1, _option2, _option3, _option4;

  ///CRUDE functions
  _addTF() {
    _listTF.add(
      Questions(
        question: _question!.capitalizeFirst,
        isTrueFalse: true,
        tFAns1: _answer1,
        tFAns2: _answer2,
        tFAns3: _answer3,
        tFAns4: _answer4,
        tFOption1: _option1,
        tFOption2: _option2,
        tFOption3: _option3,
        tFOption4: _option4,
      ),
    );
  }

  ///removes question from the Form pile
  ///NOTE...Questions are not yet saved to database!
  void _removeTF({required index}) async {
    Get.closeAllSnackbars();
    await Get.closeCurrentSnackbar();
    _listTF.remove(_listTF[index]);
    Get.back();
    Get.showSnackbar(const GetSnackBar(
      duration: Duration(seconds: 3),
      message: 'REMOVED',
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
    ));
  }

  // late Questions _fillPQ;
  void _editTF({required index}) {
    // _fillPQ = _listTF[index];
    _question = _listTF[index].question!;
    _option1 = _listTF[index].tFOption1;
    _option2 = _listTF[index].tFOption2;
    _option3 = _listTF[index].tFOption3;
    _option4 = _listTF[index].tFOption4;
    _answer1 = _listTF[index].tFAns1!;
    _answer2 = _listTF[index].tFAns2!;
    _answer3 = _listTF[index].tFAns3!;
    _answer4 = _listTF[index].tFAns4!;
    _listTF.remove(_listTF[index]);
    _isEditing = true;
    Get.back();
    setState(() {});
  }

  void _clearTexts() {
    _question;
    _option1;
    _option2;
    _option3;
    _option4;
    _answer1 = false;
    _answer2 = false;
    _answer3 = false;
    _answer4 = false;
  }

  @override
  void initState() {
    super.initState();
    _listTF.addAllIf(quizQuestions.isNotEmpty, quizQuestions);
  }

  @override
  void dispose() {
    super.dispose();
    _listTF.clear();
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
                quizQuestions.addAll(_listTF);
                Get.back();
              }),
        ],
        title: Text(
          'True or False ',
          style: bigBolo,
        ),
      ),
      body: Form(
        key: _trueFalseformKey,
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
                      _listTF.length,
                      (index) => showQuestionTF(
                            index,
                            [
                              appbarButton(
                                  icon: const Icon(
                                    Icons.edit_document,
                                  ),
                                  onpressed: () {
                                    _editTF(index: index);
                                  }),
                              appbarButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: Colors.red,
                                  ),
                                  onpressed: () {
                                    _removeTF(index: index);
                                    setState(() {});
                                  })
                            ],
                          ).marginOnly(right: 5)).reversed.toList(),
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
                    'Compose your question and options in the spaces provided. Also state if option is true or false as this will be this basis for answering questions.',
                    style: abeezee.copyWith(color: greyK),
                  ).paddingOnly(bottom: 15),
                  textEditField(
                    hint: 'Tap to add question',
                    initialval: _question,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* Required';
                      } else {
                        return null;
                      }
                    },
                    label: '',
                    tF: false,
                    trailTap: null,
                    value: null,
                    controller: (_) => _question = _,
                  ).paddingOnly(bottom: 15),
                  textEditField(
                    initialval: _option1,
                    value: _answer1,
                    trailTap: (newBool) {
                      setState(() {
                        _answer1 = newBool!;
                      });
                    },
                    tF: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* Required';
                      } else {
                        return null;
                      }
                    },
                    controller: (_) => _option1 = _,
                    label: 'Options',
                    hint: 'Enter Option',
                  ),
                  Text(_answer1 ? 'True' : 'False',
                          style: abeezee.copyWith(
                              color: _answer1 ? Colors.green : Colors.red))
                      .paddingOnly(left: 10, top: 5),
                  const Divider(height: 20),
                  textEditField(
                    initialval: _option2,
                    value: _answer2,
                    trailTap: (newBool) {
                      setState(() {
                        _answer2 = newBool!;
                      });
                    },
                    tF: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* Required';
                      } else {
                        return null;
                      }
                    },
                    controller: (_) => _option2 = _,
                    label: '',
                    hint: 'Enter Option',
                  ),
                  Text(_answer2 ? 'True' : 'False',
                          style: abeezee.copyWith(
                              color: _answer2 ? Colors.green : Colors.red))
                      .paddingOnly(left: 10, top: 5),
                  const Divider(height: 20),
                  textEditField(
                    initialval: _option3,
                    value: _answer3,
                    trailTap: (newBool) {
                      setState(() {
                        _answer3 = newBool!;
                      });
                    },
                    tF: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* Required';
                      } else {
                        return null;
                      }
                    },
                    controller: (_) => _option3 = _,
                    label: '',
                    hint: 'Enter Option',
                  ),
                  Text(_answer3 ? 'True' : 'False',
                          style: abeezee.copyWith(
                              color: _answer3 ? Colors.green : Colors.red))
                      .paddingOnly(left: 10, top: 5),
                  const Divider(height: 20),
                  textEditField(
                    initialval: _option4,
                    value: _answer4,
                    trailTap: (newBool) {
                      setState(() {
                        _answer4 = newBool!;
                      });
                    },
                    tF: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* Required';
                      } else {
                        return null;
                      }
                    },
                    controller: (_) => _option4 = _,
                    label: '',
                    hint: 'Enter Option',
                  ),
                  Text(_answer4 ? 'True' : 'False',
                          style: abeezee.copyWith(
                              color: _answer4 ? Colors.green : Colors.red))
                      .paddingOnly(left: 10, top: 5),
                ],
              ).paddingOnly(left: 20, right: 20, bottom: 15, top: 5)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: whiteK,
          shape: CircleBorder(
              side: BorderSide(width: 1, color: Get.theme.primaryColor)),
          onPressed: () async {
            if (_isEditing && _trueFalseformKey.currentState!.validate()) {
              _addTF();
              _clearTexts();
              setState(() {
                _isEditing = false;
              });
            } else {
              if (_trueFalseformKey.currentState!.validate()) {
                Get.closeAllSnackbars();
                await Get.closeCurrentSnackbar();
                _addTF();
                _clearTexts();
                setState(() {});
              }
            }
          },
          child: _isEditing
              ? const Icon(Icons.edit_document)
              : const Icon(Icons.add)),
    );
  }

  ///widgets.
  Widget showQuestionTF(int index, actions) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
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
                _listTF[index].question!,
                style: bolo.copyWith(
                    color: whiteK, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.dialog(
          AlertDialog(
            actions: actions,
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            title: Text(
              '${(index + 1).toString()}. ${_listTF[index].question!}',
              style: raleway,
            ),
            content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Options',
                    style: raleway,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          color: greyK.withOpacity(.1),
                          child: Text(
                              'Question: ${_listTF[index].tFOption1}\nAnswer: ${_listTF[index].tFAns1}',
                              style: montserrat),
                        ),
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          color: greyK.withOpacity(.1),
                          child: Text(
                              'Question: ${_listTF[index].tFOption2}\nAnswer: ${_listTF[index].tFAns2}',
                              style: montserrat),
                        ),
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          color: greyK.withOpacity(.1),
                          child: Text(
                              'Question: ${_listTF[index].tFOption3}\nAnswer: ${_listTF[index].tFAns3}',
                              style: montserrat),
                        ),
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          color: greyK.withOpacity(.1),
                          child: Text(
                              'Question: ${_listTF[index].tFOption4}\nAnswer: ${_listTF[index].tFAns4}',
                              style: montserrat),
                        ),
                      ]),
                ]),
          ),
        );
      },
    );
  }
}
