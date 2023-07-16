import 'package:flutter/material.dart';

import 'package:explore_nearby/screens/home_screen.dart';
import 'package:explore_nearby/screens/login_screen.dart';
import 'package:explore_nearby/screens/register_screen.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GFButton(
                    color: Colors.white,
                    size: 40,
                    shape: GFButtonShape.pills,
                    borderSide: BorderSide(color: Colors.black,width: 1.5),
                    onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Login()));

                }, child: Text('Sign In',style: TextStyle(fontSize: 18,color: Colors.black),)),
                GFButton(
                    color: Colors.white,
                    size: 40,
                    shape: GFButtonShape.pills,
                    borderSide: BorderSide(color: Colors.black,width: 1.5),onPressed:(){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Register()));

                }, child: Text('Register',style: TextStyle(fontSize: 18,color: Colors.black),)),
                SizedBox(
                  height: 40 ,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

goToHomeScreen(BuildContext context) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()));
}
