import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'datastore_func.dart';

String userUIDKey = 'Uid';
String userEmailKey = 'Email';
String userNameKey = 'User_Name';
String userProfilePicKey = 'User_Profile_Photo';
String userPhoneNumbKey = 'User_Phone_Number';
String scoresLabelKey = 'Score_Label';
String scoredateModifiedKey = 'Scored_Modified';
String scorePointKey = 'Score_Point';

class UserFile {
  String? uid;
  String? email;
  String? userName;
  String? profilePhoto;
  int? phoneNumber;
  bool? admin;
  String? notificationUID;
  String? scoresLabel;
  String? scoredateModified;
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
    this.scoredateModified,
    this.scorePoint,
  });

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{};
    data[userUIDKey] = uid;
    data[userEmailKey] = email;
    data[userNameKey] = userName ?? ' ';
    data[userProfilePicKey] = profilePhoto;
    data[userPhoneNumbKey] = phoneNumber;
    data[scoresLabelKey] = scoresLabel;
    data[scoredateModifiedKey] = scoredateModified;
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
      scoresLabel: map[scoresLabelKey],
      scoredateModified: map[scoredateModifiedKey],
    );
  }
}

class UserDataHelper {
  final collection = FirebaseFirestore.instance.collection('Users');

  ///to create or edit userdata
  Future createOrEditQuestionCollection(UserFile data) async {
    return await collection
        .doc(data.userName)
        .set(data.toMap(), SetOptions(merge: true));
  }

  ///for getting the user data
  Future<UserFile> getuserdata() async {
    return await collection
        .doc()
        .get()
        .then((value) => UserFile.fromMap(value.data()!));
  }
}

///Global userdata var
UserFile? userfile;