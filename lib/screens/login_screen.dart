import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_nearby/screens/home_screen.dart';
import 'package:explore_nearby/screens/register_screen.dart';
import '../firebase/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String password = "";
  String email = "";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Explore Nearby',
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign in',
                    style: GoogleFonts.poppins(fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
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
                    cursorColor: const Color(0XFF01579B),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    enableSuggestions: true,
                    onSaved: emailChange,
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
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
                    cursorColor: Colors.lightBlueAccent,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    enableSuggestions: false,
                    obscureText: true,

                    onSaved: passChange,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have an account ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                        child: Text("Register Now",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 13, color: const Color(0XFF00838F))),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.only(right: 100, left: 100),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            final res = await _auth.signInWithCredential(
                                email, password, context);
                            if (context.mounted) {
                              if (res != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              }
                            }
                          }
                        },
                        child: Text(
                          'Sign In',
                          style:
                          GoogleFonts.poppins(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
