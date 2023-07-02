// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_nearby/models/user_model.dart';
import 'package:explore_nearby/screens/login_screen.dart';

import '../firebase/auth.dart';
import '../firebase/firestoreDB.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String password = "";
  String email = "";
  String name = "";
  String surname = "";

  final _auth = AuthRepository();
  void emailChange(String? value) {
    setState(() {
      email = value ?? "";
    });
  }

  void passChange(String? value) {
    setState(() {
      password = value ?? "";
    });
  }

  void nameChange(String? value) {
    setState(() {
      name = value ?? "";
    });
  }

  void surnameChange(String? value) {
    setState(() {
      surname = value ?? "";
    });
  }

  firestoreDB DB = firestoreDB();
  String userName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Register',
          style: GoogleFonts.viga(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Center(
              child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter valid name';
                    }
                    return null;
                  },
                  onSaved: nameChange,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                    labelText: 'Surname',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter valid name';
                    }
                    return null;
                  },
                  onSaved: nameChange,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enableSuggestions: true,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter valid email';
                    }
                    return null;
                  },
                  onSaved: emailChange,
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  enableSuggestions: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter valid password';
                    }
                    return null;
                  },
                  onSaved: passChange,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: Container(
                    margin: const EdgeInsets.only(right: 100, left: 100),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final res = await _auth.createUser(
                              name, email, password, surname, context);

                          if (context.mounted) {
                            if (res != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            }
                          }
                        }
                      },
                      child: Text(
                        'Register',
                        style:
                            GoogleFonts.viga(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

Future<String> firestoreValidator(String username) async {
  // ignore: unused_local_variable
  var nicksCollection = FirebaseFirestore.instance.collection('nick_uid');

  return "a";
}
