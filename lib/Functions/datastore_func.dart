import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

///Quiz model.
class QuizModel {
  static const questBankKey = 'Question Bank';
  static const quiznameKey = 'Quiz_name';
  static const descriptionKey = 'description';
  static const courseKey = 'course';
  static const fieldImageKey = 'field_image';
  static const favoritedKey = 'favorited';
  static const questionsKey = 'questions';
  static const playsKey = 'plays';
  static const dateModifiedKey = 'date_modified';
  static const authorsnameKey = 'authors_name';
  static const authorsemailKey = 'authors_email';

  String? name;
  String? fieldImage;
  String? course;
  int? favorited;
  int? plays;
  String? description;
  Timestamp? dateModified;
  String? authorsname;
  String? authorsemail;

  QuizModel({
    this.name,
    this.fieldImage,
    this.plays,
    this.course,
    this.description,
    this.favorited,
    this.dateModified,
    this.authorsname,
    this.authorsemail,
  });

  Map<String, dynamic> toMap(QuizModel data) {
    Map<String, dynamic> map = {};
    map[quiznameKey] = data.name;
    map[courseKey] = data.course;
    map[fieldImageKey] = data.fieldImage;
    map[descriptionKey] = data.description;
    map[favoritedKey] = data.favorited;
    map[playsKey] = data.plays;
    map[dateModifiedKey] = data.dateModified;
    map[authorsnameKey] = data.authorsname;
    map[authorsemailKey] = data.authorsemail;

    return map;
  }

  QuizModel.toClass(Map<String, dynamic> map) {
    name = map[quiznameKey];
    course = map[courseKey];
    description = map[descriptionKey];
    favorited = map[favoritedKey];
    plays = map[playsKey];
    dateModified = map[dateModifiedKey];
    authorsname = map[authorsnameKey];
    authorsemail = map[authorsemailKey];
    fieldImage = map[fieldImageKey];
  }
}

class Questions {
  static const questionTypeKey = 'is_tF';

  static const questionKey = 'question';
  static const tFOption1Key = 'tF_Opt_1';
  static const tFOption2Key = 'tF_Opt_2';
  static const tFOption3Key = 'tF_Opt_3';
  static const tFOption4Key = 'tF_Opt_4';
  static const tFAns1Key = 'tF_ans_1';
  static const tFAns2Key = 'tF_ans_2';
  static const tFAns3Key = 'tF_ans_3';
  static const tFAns4Key = 'tF_ans_4';

  static const correctAnswerKey = 'correct_Answer';
  static const incorrectAnswer1Key = 'Incorrect_1';
  static const incorrectAnswer2Key = 'Incorrect_2';
  static const incorrectAnswer3Key = 'Incorrect_3';

  String? tFOption1, tFOption2, tFOption3, tFOption4;
  bool? tFAns1, tFAns2, tFAns3, tFAns4;
  String? question;
  bool? isTrueFalse;
  String? correctAnswer, incorrectAnswer1, incorrectAnswer2, incorrectAnswer3;

  Questions({
    this.isTrueFalse,
    this.question,
    this.tFOption1,
    this.tFOption2,
    this.tFOption3,
    this.tFOption4,
    this.tFAns1,
    this.tFAns2,
    this.tFAns3,
    this.tFAns4,
    this.correctAnswer,
    this.incorrectAnswer1,
    this.incorrectAnswer2,
    this.incorrectAnswer3,
  });

  Map<String, dynamic> toMap(Questions data) {
    Map<String, dynamic> map = {};
    map[questionTypeKey] = data.isTrueFalse ?? false;

    map[questionKey] = data.question;
    map[tFOption1Key] = data.tFAns1;
    map[tFOption2Key] = data.tFAns2;
    map[tFOption3Key] = data.tFAns3;
    map[tFOption4Key] = data.tFAns4;
    map[correctAnswerKey] = data.correctAnswer;
    map[incorrectAnswer1Key] = data.incorrectAnswer1;
    map[incorrectAnswer2Key] = data.incorrectAnswer2;
    map[incorrectAnswer3Key] = data.incorrectAnswer3;

    return map;
  }

  Questions.toClass(Map<String, dynamic> map) {
    isTrueFalse = map[questionTypeKey];

    question = map[questionKey];
    tFOption1 = map[tFOption1Key];
    tFOption2 = map[tFOption2Key];
    tFOption3 = map[tFOption3Key];
    tFOption4 = map[tFOption4Key];
    tFAns1 = map[tFAns1Key];
    tFAns2 = map[tFAns2Key];
    tFAns3 = map[tFAns3Key];
    tFAns4 = map[tFAns4Key];

    correctAnswer = map[correctAnswerKey];
    incorrectAnswer1 = map[incorrectAnswer1Key];
    incorrectAnswer2 = map[incorrectAnswer2Key];
    incorrectAnswer3 = map[incorrectAnswer3Key];
  }
}

class DatabaseHelper {
  final _firebaseFirestore = FirebaseFirestore.instance;

  ///for getting the question collection
  Future<List<QuizModel>> getQuestionCollections() async {
    return await _firebaseFirestore
        .collection(QuizModel.questBankKey)
        .get()
        .then((value) =>
            value.docs.map((e) => QuizModel.toClass(e.data())).toList());
  }

  Future createQuizz({required QuizModel bank}) async {
    return await _firebaseFirestore
        .collection(QuizModel.questBankKey)
        .doc(bank.authorsname)
        .set(bank.toMap(bank), SetOptions(merge: true));
  }

  // Stream<List<QuizModel>> get quizModel {
  //   return _firebaseFirestore
  //       .collection(QuizModel.questBankKey)
  //       .snapshots()
  //       .map((event) => event.docs
  //           .map((data) => QuizModel.toClass(data as Map<String, dynamic>))
  //           .toList());
  // }

  ///for adding a question
  Future addOrEditQuestion(
      Questions question, String course, String author, String title) async {
    return await _firebaseFirestore
        .collection(QuizModel.questBankKey)
        .doc(course)
        .collection(author)
        .doc(title)
        .set(question.toMap(question), SetOptions(merge: true));
  }
}

FirebaseStorage firebaseStorage = FirebaseStorage.instance;
Future<String> uploadFile(File file, String path) async {
  //var user = currentUser();
  late String text;
  var task = firebaseStorage.ref(path).putFile(file);
  await task.whenComplete(() async {
    if (task.snapshot.state == TaskState.success) {
      text = await task.snapshot.ref.getDownloadURL();
    } else {
      text = error;
    }
  });
  return text;
}

Future deleteImage(String url) async {
  return await firebaseStorage.refFromURL(url).delete();
}

const error = 'Error';
