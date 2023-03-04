import 'package:flutter/material.dart';

// class ChartSampleData {
//   ChartSampleData(this.x, this.y);

//   final String x;
//   final double y;
// }

// List<ChartSampleData> chartData = [
//   ChartSampleData('Jan', 50),
//   ChartSampleData('Feb', 28),
// ];

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
    data[userNameKey] = userName ?? 'Name' ;
    data[userProfilePicKey] = profilePhoto ;
    data[userPhoneNumbKey] = phoneNumber;
    data[userAdminKey] = admin;
    data[notificationUIDKey] = notificationUID;
    data[scoresLabelKey] = scoresLabel ;
    data[scoreDateKey] = scoreDate;
    data[scorePointKey] = scorePoint;

    return data;
  }

  factory UserFile.fromMap(Map<String, dynamic> map,) {
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

class OnlineUsersData {
  OnlineUsersData({
    this.name,
    this.image,
    this.timestamp,
  });

  final String? name;
  final String? image;
  final DateTime? timestamp;
}

List<OnlineUsersData> onlineuserdata = [
  OnlineUsersData(
    name: 'Stephanie',
    image: '',
    timestamp: DateTime.now(),
  ),
  OnlineUsersData(
    name: 'chimmy',
    image: '',
    timestamp: DateTime.now(),
  ),
  OnlineUsersData(
    name: 'DeCoast',
    image: '',
    timestamp: DateTime.now(),
  ),
  OnlineUsersData(
    name: 'Vanessa',
    image: '',
    timestamp: DateTime.now(),
  ),
  OnlineUsersData(
    name: 'Sandra',
    image: '',
    timestamp: DateTime.now(),
  ),
];

///Chart sample data
class ChartData {
  /// Holds the datapoint values like x, y, etc.,
  ChartData({
    this.x,
    this.y,
    this.text,
  });

  final dynamic x;
  final num? y;
  final String? text;
}

List<ChartData> chartdata = <ChartData>[
  ChartData(
    x: 'Vanessa',
    y: 10,
    text: '100%',
  ),
  ChartData(
    x: 'Chimmy',
    y: 11,
    text: '100%',
  ),
  ChartData(
    x: 'DeCoast',
    y: 12,
    text: '100%',
  ),
  ChartData(
    x: 'Steph',
    y: 13,
    text: '100%',
  ),
];
