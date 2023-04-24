import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharm_quiz/UI/Screens/Quiz/quiz_questions.dart';
import 'package:pharm_quiz/UI/strings.dart';
import 'package:pharm_quiz/Functions/user_func.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/app_widgets.dart';
import '../../../Functions/datastore_func.dart';
import '../User/widgets.dart';
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
  String? _title, _description;
  Color? theme = Colors.blue;
  bool isSaved = false;
  String course = '';
  bool _tF = false;
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  final _whiteButton =
      ButtonStyle(backgroundColor: MaterialStatePropertyAll(whiteK));

  _saveQuiz() async {
    await DatabaseHelper()
        .createQuizz(
      bank: QuizModel(
        name: _title,
        course: selectedValue,
        authorsemail: userfile?.email ?? unknown,
        authorsname: userfile?.userName ?? unknown,
        description: _description ?? 'Test your knowledge in this course',
        favorited: 0,
        plays: 0,
        dateModified: Timestamp.fromDate(DateTime.now()),
      ),
    )
        .then((value) {
      Get.showSnackbar(const GetSnackBar(
        borderRadius: 15,
        isDismissible: true,
        duration: Duration(milliseconds: 1500),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        message: "Successfully added",
        snackPosition: SnackPosition.BOTTOM,
      ));
      Get.back();
    });
  }

  File? imageFile;
  pickImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // quizQuestions.clear();
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
                child: InkWell(
                  onTap: pickImage,
                  child: imageFile != null
                      ? Image.file(imageFile!, fit: BoxFit.fill)
                      : Center(
                          child: Icon(Icons.image,
                              color: Get.theme.primaryColor, size: 50),
                        ),
                ),
              ).paddingOnly(bottom: 15),
              textEditField(
                  initialval: _title,
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
                  controller: (_) => _title = _,
                  hint: 'Enter title',
                  label: 'Title'),
              textEditField(
                  initialval: _description,
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
                  controller: (_) => _description = _,
                  hint: 'Enter Description',
                  label: 'Description'),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course',
                    style: bolo.copyWith(fontWeight: FontWeight.w600),
                  ),
                  dropDownButton(
                    context: context,
                    hintText: 'select course...',
                    items: courses,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    selectedValue: selectedValue,
                    textEditingController: textEditingController,
                  ),
                ],
              ),
              Column(
                children: List.generate(
                    quizQuestions.length, (index) => showQuestions(index)),
              ),
              const SizedBox(height: 40),
              isSaved
                  ? Container()
                  : Center(
                      child: ElevatedButton(
                          style: textButtonStyl,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await _saveQuiz();
                              Get.bottomSheet(_showQuestionFormat());
                            }
                          },
                          child: Text(
                            'Add Questions',
                            style: poppins.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ).paddingSymmetric(horizontal: 40, vertical: 20)),
                    ),
              SizedBox(height: quizQuestions.isEmpty ? 0 : 40)
            ],
          ),
        ),
      ),
    );
  }

  Widget _showQuestionFormat() {
    return Scaffold(
      body: Padding(
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
                quizGridTile(
                  ontap: () async {
                    _tF = true;
                    await Get.to(() => const TrueOrFalse(),
                            transition: Transition.downToUp)!
                        .whenComplete(() {
                      quizQuestions.isEmpty ? _tF = false : _tF = true;
                      setState(() {});
                      Get.back();
                    });
                  },
                  icondata: CupertinoIcons.game_controller_solid,
                  title: 'True or False',
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
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
            Icons.remove_circle_outline_rounded,
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
