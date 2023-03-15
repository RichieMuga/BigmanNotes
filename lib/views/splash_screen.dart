import 'package:bigmannotes/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Get.to(() => HomePage()),
      title: new Text(
        'Flutter Tutorials',
        textScaleFactor: 2,
      ),
      image:Image.asset("assets/Elipse1.png"),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
