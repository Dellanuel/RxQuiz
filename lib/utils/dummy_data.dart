import 'package:flutter/material.dart';
import '../UI/strings.dart';

String userUIDKey = 'userUIDkey';
String userEmailKey = 'emailkey';
String userNameKey = 'userNamekey';
String userProfilePicKey = 'userprofilePhotokey';
String userPhoneNumbKey = 'userphoneNumberkey';
String userAdminKey = 'useradminkey';
String notificationUIDKey = 'usernotificationUIDkey';
String scoresLabelKey = 'ScoresLabelKey';
String scoreDateKey = 'ScoreDateKey';
String scorePointKey = 'Scorepointkey';

class UserFile {
  String? uid;
  String? email;
  String? userName;
  String? profilePhoto;
  int? phoneNumber;
  bool? admin;
  String? notificationUID;
  String? scoresLabel;
  String? scoreDate;
  num? scorePoint;

  UserFile({
    this.email,
    this.uid,
    this.userName,
    this.profilePhoto,
    this.phoneNumber,
    this.admin,
    this.notificationUID,
    this.scoresLabel,
    this.scoreDate,
    this.scorePoint,
  });

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{};
    data[userUIDKey] = uid;
    data[userEmailKey] = email;
    data[userNameKey] = userName ?? 'Name';
    data[userProfilePicKey] = profilePhoto;
    data[userPhoneNumbKey] = phoneNumber;
    data[userAdminKey] = admin;
    data[notificationUIDKey] = notificationUID;
    data[scoresLabelKey] = scoresLabel;
    data[scoreDateKey] = scoreDate;
    data[scorePointKey] = scorePoint;

    return data;
  }

  factory UserFile.fromMap(
    Map<String, dynamic> map,
  ) {
    return UserFile(
      phoneNumber: map[userPhoneNumbKey],
      email: map[userEmailKey],
      profilePhoto: map[userProfilePicKey],
      userName: map[userNameKey],
      uid: map[userUIDKey],
      admin: map[userAdminKey],
      notificationUID: map[notificationUIDKey],
      scoresLabel: map[scoresLabelKey],
      scoreDate: map[scoreDateKey],
    );
  }
}

class QuizModel {
  String? fieldImage;
  String? course;
  Color? color;
  String? authorsname;
  String? quizname;
  int? trend;

  String? playsNum;

  String? date;

  String? questionnumber;

  String? favourited;

  String? authorsemail;

  String? description;

  QuizModel({
    this.favourited,
    this.description,
    this.quizname,
    this.authorsname,
    this.authorsemail,
    this.course,
    this.color,
    this.fieldImage,
    this.trend,
    this.date,
    this.playsNum,
    this.questionnumber,
  });
}

List<QuizModel> quizModelData = [
  QuizModel(
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    authorsemail: 'chinemelue1@gmail.com',
    favourited: '0',
    date: DateTime.now().toString(),
    playsNum: '18',
    questionnumber: '10',
    trend: 7,
    quizname: 'QUIZ 0',
    authorsname: 'Chinemelu',
    fieldImage: pharLottie,
    color: Colors.pink,
    course: 'Pharmceutics',
  ),
  QuizModel(
    favourited: '0',
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    authorsemail: 'chinemelue1@gmail.com',
    date: DateTime.now().toString(),
    playsNum: '18',
    questionnumber: '10',
    trend: 6,
    quizname: 'QUIZ 1',
    authorsname: 'Chinemelu',
    fieldImage: chemLottie,
    color: Colors.red,
    course: 'Pharm Chem',
  ),
  QuizModel(
    favourited: '0',
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    authorsemail: 'chinemelue1@gmail.com',
    date: DateTime.now().toString(),
    playsNum: '18',
    questionnumber: '10',
    trend: 7,
    quizname: 'QUIZ 2',
    authorsname: 'Chinemelu',
    fieldImage: cogLottie,
    color: Colors.green,
    course: 'Cognosy',
  ),
  QuizModel(
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    favourited: '0',
    authorsemail: 'chinemelue1@gmail.com',
    date: DateTime.now().toString(),
    playsNum: '18',
    questionnumber: '10',
    trend: 7,
    quizname: 'QUIZ 3',
    authorsname: 'Chinemelu',
    fieldImage: colLottie,
    color: Colors.blue[900],
    course: 'Cology',
  ),
  QuizModel(
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    favourited: '0',
    date: DateTime.now().toString(),
    authorsemail: 'chinemelue1@gmail.com',
    playsNum: '18',
    questionnumber: '10',
    trend: 3,
    quizname: 'QUIZ 4',
    authorsname: 'Chinemelu',
    fieldImage: mcbLottie,
    color: Colors.orange,
    course: 'Pharm MCB',
  ),
  QuizModel(
    favourited: '0',
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    authorsemail: 'chinemelue1@gmail.com',
    date: DateTime.now().toString(),
    playsNum: '18',
    questionnumber: '10',
    trend: 8,
    quizname: 'QUIZ 5',
    authorsname: 'Chinemelu',
    fieldImage: bchLottie,
    color: Colors.purple,
    course: 'Pharm BCH',
  ),
  QuizModel(
    favourited: '0',
    date: DateTime.now().toString(),
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    authorsemail: 'chinemelue1@gmail.com',
    playsNum: '18',
    questionnumber: '10',
    trend: 8,
    quizname: 'QUIZ 6',
    authorsname: 'Chinemelu',
    fieldImage: cliLottie,
    color: Colors.amber,
    course: 'Clinical Pharm',
  ),
  QuizModel(
    favourited: '0',
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    trend: 7,
    date: DateTime.now().toString(),
    playsNum: '18',
    authorsemail: 'chinemelue1@gmail.com',
    questionnumber: '10',
    quizname: 'QUIZ 7',
    authorsname: 'Chinemelu',
    fieldImage: techLottie,
    course: 'Pharm Tech',
    color: Colors.lime,
  ),
  QuizModel(
    favourited: '0',
    trend: 9,
    description:
        'This is a pharmaceutical quizzer. Lets\'s put your knowledge tp a test. This field describes the nature of the questions of the quiz and specifies instructions.',
    authorsemail: 'chinemelue1@gmail.com',
    date: DateTime.now().toString(),
    playsNum: '18',
    questionnumber: '10',
    quizname: 'QUIZ 8',
    authorsname: 'Chinemelu',
    fieldImage: sapLottie,
    color: Colors.teal,
    course: 'SAP-Pharm',
  ),
];
