import 'package:flutter/material.dart';
import 'package:explore_nearby/constants/routes.dart';
// import 'package:social_academy/services/auth/auth_exceptions.dart';
// import 'package:social_academy/services/auth/auth_provider.dart';
// import 'package:social_academy/services/auth/auth_service.dart';
import '../constants/routes.dart';
import 'verify_email_screen.dart';
import 'dart:developer' as devtools show log;

// import '../firebase_options.dart';
// import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontStyle: FontStyle.italic,
          letterSpacing: 3,
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            decoration: const InputDecoration(
              hintText: "something@some.thing",
            ),
            // obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              hintText: "Very secret password here",
            ),
          ),
          TextButton(
            onPressed: (() async {
              final email = _email.text;
              final password = _password.text;
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(homepageRoute, (route) => false);
            }),
            //   try {
            //     final userCredential = await AuthService.firebase().logIn(
            //       email: email,
            //       password: password,
            //     );
            //     final user = AuthService.firebase().currentUser;
            //     if (user?.isEmailVerified ?? false) {
            //       devtools.log(userCredential.toString());
            //       Navigator.of(context)
            //           .pushNamedAndRemoveUntil(messagesRoute, (route) => false);
            //     } else {
            //       Navigator.of(context).pushNamedAndRemoveUntil(
            //           verifyEmailRoute, (route) => false);
            //       showErrorDialog(context,
            //           "Your email isn't verified. Please verify here.");
            //     }
            //   } on UserNotFoundAuthException catch (e) {
            //     devtools.log("!user not found");
            //     await showErrorDialog(
            //       context,
            //       "User not found.",
            //     );
            //   } on WrongPasswordAuthException {
            //     await showErrorDialog(
            //       context,
            //       "Wrong password.",
            //     );
            //     devtools.log("!wrong password");
            //   } on GenericAuthException {
            //     devtools.log("Auth Error");
            //     await showErrorDialog(
            //       context,
            //       "Something went wrong at authentication.",
            //     );
            //   }
            // }),
            child: const Text("Login Button"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text("Not registered yet? Register here!"),
          )
        ],
      ),
    );
  }
}
