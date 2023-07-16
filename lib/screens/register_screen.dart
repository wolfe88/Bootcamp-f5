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
          'Explore Nearby',
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Register',
                        style: GoogleFonts.poppins(fontSize: 40),

                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          prefixIcon: Icon(Icons.edit, color: Colors.blue, size: 36),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.blue[50],
                        ),
                        onSaved: nameChange,
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          prefixIcon: Icon(Icons.edit, color: Colors.blue, size: 36),
                          hintText: "Surname",
                          hintStyle: TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.blue[50],
                        ),
                        onSaved: nameChange,
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          prefixIcon: Icon(Icons.person, color: Colors.blue, size: 36),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.blue[50],
                        ),
                        onSaved: emailChange,
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        enableSuggestions: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.blue, size: 36),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.blue[50],
                        ),
                        onSaved: passChange,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        child: Container(
                          margin: const EdgeInsets.only(right: 75, left: 75),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final res = await _auth.createUser(
                                    name, email, password,surname, context);

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
                              GoogleFonts.poppins(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
Future<String> firestoreValidator(String username) async {
  var nicksCollection = FirebaseFirestore.instance.collection('nick_uid');

  return "a";
}