import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import 'model.dart';
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
  final _question = TextEditingController();
  final _option1 = TextEditingController();
  final _option2 = TextEditingController();
  final _option3 = TextEditingController();
  final _option4 = TextEditingController();

  ///CRUDE functions
  _addTF() {
    _listTF.add(
      Questions(question: _question.text.capitalizeFirst, tFOptions: [
        {
          _option1.text: _answer1,
          _option2.text: _answer2,
          _option3.text: _answer3,
          _option4.text: _answer4,
        }
      ]),
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
    _question.text = _listTF[index].question!;
    _option1.text = _listTF[index].tFOptions!.elementAt(0).keys.elementAt(0);
    _option2.text = _listTF[index].tFOptions!.elementAt(0).keys.elementAt(1);
    _option3.text = _listTF[index].tFOptions!.elementAt(0).keys.elementAt(2);
    _option4.text = _listTF[index].tFOptions!.elementAt(0).keys.elementAt(3);
    _answer1 =
        _listTF[index].tFOptions!.elementAt(0).values.elementAt(0) as bool;
    _answer2 =
        _listTF[index].tFOptions!.elementAt(0).values.elementAt(1) as bool;
    _answer3 =
        _listTF[index].tFOptions!.elementAt(0).values.elementAt(2) as bool;
    _answer4 =
        _listTF[index].tFOptions!.elementAt(0).values.elementAt(3) as bool;
    _listTF.remove(_listTF[index]);
    _isEditing = true;
    Get.back();
    setState(() {});
  }

  void _clearTexts() {
    _question.clear();
    _option1.clear();
    _option2.clear();
    _option3.clear();
    _option4.clear();
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
                Ionicons.save_outline,
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
                                    Ionicons.pencil_outline,
                                  ),
                                  onpressed: () {
                                    _editTF(index: index);
                                  }),
                              appbarButton(
                                  icon: const Icon(
                                    Ionicons.trash_outline,
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: curved,
                        border: Border.all(
                            width: 1, color: Get.theme.primaryColor)),
                    child: Center(
                        child: TextFormField(
                      autofocus: true,
                      controller: _question,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Required';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {},
                      style: poppins.copyWith(overflow: TextOverflow.clip),
                      maxLines: null,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Tap to add question'),
                    )),
                  ).paddingOnly(bottom: 15),
                  textEditField(
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
                    controller: _option1,
                    label: 'Options',
                    hint: 'Enter Option',
                  ),
                  Text(_answer1 ? 'True' : 'False',
                          style: abeezee.copyWith(
                              color: _answer1 ? Colors.green : Colors.red))
                      .paddingOnly(left: 10, top: 5),
                  const Divider(height: 20),
                  textEditField(
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
                    controller: _option2,
                    label: '',
                    hint: 'Enter Option',
                  ),
                  Text(_answer2 ? 'True' : 'False',
                          style: abeezee.copyWith(
                              color: _answer2 ? Colors.green : Colors.red))
                      .paddingOnly(left: 10, top: 5),
                  const Divider(height: 20),
                  textEditField(
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
                    controller: _option3,
                    label: '',
                    hint: 'Enter Option',
                  ),
                  Text(_answer3 ? 'True' : 'False',
                          style: abeezee.copyWith(
                              color: _answer3 ? Colors.green : Colors.red))
                      .paddingOnly(left: 10, top: 5),
                  const Divider(height: 20),
                  textEditField(
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
                    controller: _option4,
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
              ? const Icon(Ionicons.pencil_outline)
              : const Icon(Ionicons.add)),
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
        final options = _listTF[index].tFOptions!;
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
                    children: List.generate(
                      options[0].keys.length,
                      (index) => Container(
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        color: greyK.withOpacity(.1),
                        child: Text(
                            'Question: ${options[0].keys.elementAt(index)}\nAnswer: ${options[0].values.elementAt(index)}',
                            style: montserrat),
                      ),
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
