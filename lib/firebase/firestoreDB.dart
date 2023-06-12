import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore_nearby/firebase/auth.dart';
import 'package:http/http.dart' as http;
import 'package:explore_nearby/models/user_model.dart';

import '../models/user_profile_model.dart';

class firestoreDB {
  final _firestore = FirebaseFirestore.instance;
  late CollectionReference usersRef = _firestore.collection("users");

  get CUuid => AuthRepository().getCurrentUsersID();

  // CollectionReference _activities;
  // CollectionReference _something;
  // CollectionReference _something;
  Stream get CUprofile =>
      _firestore
          .collection("users")
          .doc("$CUuid")
          .snapshots(); // a stream that is continuously listening for changes happening in the users own document

  String firestoreValidator(String nick) {
    return "a";
  }


  Future<UserProfileModel>? getProfileFromUsername(uid) async {
    try {
      CollectionReference<Map<String, dynamic>> _users =
      _firestore.collection('users');

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _users
          .where("uid", isEqualTo: uid)
          .get();

      if (querySnapshot.size > 0) {
        print(querySnapshot.docs[0].data().toString() + "this is first");
        var a = UserProfileModel.fromMap(querySnapshot.docs[0].data());
        print(a.toString());
        return a;
      } else {
        return UserProfileModel();
      }
    } catch (e) {
      print(e.toString() + " this is catch");
      return UserProfileModel();
    }
  }

}
// Creating a simple Riverpod provider that provides an instance of our Database class so that it can be used from our UI(by calling Database class methods)
