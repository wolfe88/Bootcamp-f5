import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference get _users => _firestore.collection("users");
  Future<UserCredential?> signInWithCredential(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Wrong password provided for that user.')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
      }

      return null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An error occurred. Please try again later.')));
      return null;
    }
  }

  // get current users name from firestore.

  Future<String> getCurrentUsersName() async {
    final currentUser = _auth.currentUser;
    // ignore: unused_local_variable
    final uid = currentUser!.uid;
    final user = await _users.doc(currentUser.uid).get().then(
        (value) => UserModel.fromMap(value.data() as Map<String, dynamic>));
    return user.name;
  }

  Future<String> getCurrentUsersMail() async {
    final currentUser = _auth.currentUser;
    final uid = currentUser!.uid;
    final user = await _users.doc(uid).get().then(
        (value) => UserModel.fromMap(value.data() as Map<String, dynamic>));
    return user.email;
  }

  Future<String> getCurrentUsersID() async {
    final currentUser = _auth.currentUser;
    return currentUser!.uid;
  }

  Future<UserModel?> getUserData(String uid) {
    return _users.doc(uid).get().then(
        (value) => UserModel.fromMap(value.data() as Map<String, dynamic>));
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<bool?> deleteUserFromAuth() async {
    try {
      User? user = _auth.currentUser;

      await user!.delete().then((value) {
        return true;
      }).onError((error, stackTrace) {
        print("an error ocurred while deleting user from auth. Error: $error ");
        return false;
      });
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential?> createUser(String name, String emailAddress,
      String password, String surname, BuildContext context) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      UserModel userModel;
      if (credential.additionalUserInfo?.isNewUser ?? false) {
        userModel = UserModel(
          name: name,
          uid: credential.user!.uid,
          email: credential.user!.email!,
        );
        await _users.doc(userModel.uid).set(userModel.toMap());
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The account already exists for that email.')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
          ),
        );
      }

      return null;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }
}
