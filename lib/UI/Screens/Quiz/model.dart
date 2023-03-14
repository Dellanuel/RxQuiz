import 'package:flutter/material.dart';

///Quiz model.
class QuizModel {
  static const quiznameKey = 'Quiz_name';
  static const descriptionKey = 'Description';
  static const courseKey = 'Course';
  static const themeKey = 'Theme';
  static const tFvalueKey = 'TrueFalse';
  static const favoritedKey = 'Favorited';
  static const questionsKey = 'Questions';
  static const playsKey = 'Plays';
  static const dateModifiedKey = 'Last Modified';

  ///Questions name tag
  String? name;
  String? theme;
  String? course;
  bool? trueFalse;
  int? favorited;
  int? plays;
  String? description;
  List<Questions>? questions;
  String? dateModified;

  QuizModel({
    this.name,
    this.theme,
    this.plays,
    this.course,
    this.trueFalse,
    this.description,
    this.questions,
    this.favorited,
    this.dateModified,
  });

  Map<String, dynamic> toMap(QuizModel data) {
    Map<String, dynamic> map = {};
    map[quiznameKey] = data.name;
    map[themeKey] = data.theme;
    map[courseKey] = data.course;
    map[tFvalueKey] = data.trueFalse ?? false;
    map[descriptionKey] = data.description;
    map[questionsKey] = data.questions;
    map[favoritedKey] = data.favorited;
    map[playsKey] = data.plays;
    map[dateModifiedKey] = data.dateModified;

    // ///true or false
    // map[tFOptionsKey] = data.tFOptions;

    // ///questions and answer
    // map[quetionKey] = data.question;
    // map[quetionOptionsKey] = data.incorrectAnswers;
    // map[quetionCorrectAnswerKey] = data.correctAnswer;

    return map;
  }

  QuizModel.toClass(Map<String, dynamic> map) {
    name = map[quiznameKey];
    theme = map[themeKey];
    course = map[courseKey];
    trueFalse = map[tFvalueKey];
    description = map[descriptionKey];
    questions = map[questionsKey];
    favorited = map[favoritedKey];
    plays = map[playsKey];
    dateModified = map[dateModifiedKey];

    // ///true or false
    // tFOptions = List<Map>.from(map[tFOptionsKey]);

    // ///questions and answer
    // question = map[quetionKey];
    // correctAnswer = map[quetionCorrectAnswerKey];
    // incorrectAnswers = List<String>.from(map[quetionOptionsKey]);
  }
}

///Questions and answers model.
class Questions {
  ///true or false
  List<Map>? tFOptions;

  /// questions and answer
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  Questions({
    ///true or false
    this.tFOptions,

    ///questions and answer
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });
}
