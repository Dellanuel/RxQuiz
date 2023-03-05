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
