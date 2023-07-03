// ignore_for_file: unused_import

import 'package:explore_nearby/models/place_model.dart';
import 'package:explore_nearby/widgets/mekan.card.dart';
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
  Stream get CUprofile => _firestore
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

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _users.where("uid", isEqualTo: uid).get();

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

  Future<PlaceModel?> getPlaceFromID(placeID) async {
    try {
        final firestore = FirebaseFirestore.instance;
        final docRef = firestore.collection('places').doc(placeID);

        DocumentSnapshot doc = await docRef.get();

        if (doc.exists) {
          return PlaceModel.fromMap(doc.data() as Map<String, dynamic>);
        } else {
          return null;
        }
      }
     catch (e) {
      print(e.toString() + " this is catch");
      return PlaceModel();
    }
  }


  Future<List<PlaceModel>?> getNearbyPopularPlaces(city) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final queryRef = firestore.collection('places').where("city", isEqualTo: city);
      await queryRef.get().then((value) => print(value.docs));
      final List<PlaceModel> doc = await queryRef.get().then((value) => value.docs.map((doc) => PlaceModel.fromMap(doc.data())).toList());
      print(doc[0].name);
      return doc;
      //
      // if (doc.exists) {
      //   return PlaceModel.fromMap(doc.data() as Map<String, dynamic>);
      // } else {
      //   return null;
      // }
    }
    catch (e) {
      print(e.toString() + " this is catch");
      return null;
    }
  }

  Future<PlaceModel>? getPlaceFromX(uid) async {
    //this function isn't complete
    try {
      CollectionReference<Map<String, dynamic>> _users =
      _firestore.collection('users');

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _users.where("uid", isEqualTo: uid).get();

      if (querySnapshot.size > 0) {
        print(querySnapshot.docs[0].data().toString() + "this is first");
        var a = PlaceModel.fromMap(querySnapshot.docs[0].data());
        print(a.toString());
        return a;
      } else {
        return PlaceModel();
      }
    } catch (e) {
      print(e.toString() + " this is catch");
      return PlaceModel();
    }
  }
}
// Creating a simple Riverpod provider that provides an instance of our Database class so that it can be used from our UI(by calling Database class methods)
