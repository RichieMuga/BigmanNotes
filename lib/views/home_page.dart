import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/gradientBackground.dart';
import '../widgets/image_list.dart';
import '../widgets/size_Box.dart';
import 'login_view.dart';
import 'register_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      letterSpacing: 3)),
              const Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: Text('BIGMAN NOTES',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(104, 54, 147, 1),
                        fontFamily: 'Bebas Neue',
                        fontSize: 36,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 30, bottom: 60),
                child: Row(
                  children: [
                    const ExpandedImageWidget(imagePath: 'assets/Ellipse1.png'),
                    SizedBoxWidget(),
                    const ExpandedImageWidget(imagePath: 'assets/Polygon1.png'),
                    SizedBoxWidget(),
                    const ExpandedImageWidget(
                        imagePath: 'assets/Rectangle9.png'),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const RegisterView());
                  },
                  child: const Text('Sign up'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF6D478C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      textStyle: const TextStyle(fontSize: 16)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 35.0),
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
                    Get.to(const LoginView());
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF5442C1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      textStyle: const TextStyle(fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
