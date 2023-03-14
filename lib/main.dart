import 'package:bigmannotes/views/home_view.dart';
import 'package:bigmannotes/views/login_view.dart';
import 'package:bigmannotes/views/register_view.dart';
import 'package:bigmannotes/views/splash_screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'views/splash_screen.dart';

/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: BoxDecoration(
          gradient: MyGradientBackground()
        ),
        child:MyHomePage() ,
      ),
    ),
  );
}

class MyGradientBackground extends LinearGradient {
  MyGradientBackground()
      : super(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFB44FBE), Color(0xFFB44FBE), Color(0xFFF4E1F5)],
          stops: [0.0,0.4, 1.0],
        );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                gradient: MyGradientBackground(),
              ),
            child: Center(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "WELCOME"
                  "  TO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color.fromRGBO(61, 27, 64, 1),
                      fontFamily: 'Poppins',
                      fontSize: 26,
                      letterSpacing: 3)
                      ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
              child: Text(
                'BIGMAN NOTES', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(104, 54, 147, 1),
                fontFamily: 'Bebas Neue',
                fontSize: 36,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1
                )
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 30, bottom: 60),
            child: Row(
                children: [
                   Expanded(
                      child: Image.asset(
                        'assets/Ellipse1.png',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 90,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/Polygon1.png',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 90,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/Rectangle9.png',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 90,
                      ),
                    ),
                ],
            ),
          ),
            SizedBox(
              
              width: 200,
              height: 45,
              child: ElevatedButton(
                onPressed: (){
                  Get.to(LoginView());
                }, 
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF6D478C),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                    )
                ,textStyle: TextStyle(fontSize: 16)  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0,bottom: 35.0),
              child: const Text(
                "Don't have an account?",
                style: TextStyle(decoration: TextDecoration.underline),
                ),
            ),
            SizedBox(
                width: 100,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(LoginView());
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF5442C1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      textStyle: TextStyle(fontSize: 16)),
                ),
              )
            ],
                ),
              ),
          )
      ),
    );
  }
}

