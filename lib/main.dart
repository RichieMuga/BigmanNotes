import 'package:bigmannotes/views/login_view.dart';
import 'package:bigmannotes/views/register_view.dart';
import 'package:bigmannotes/views/splash_screen.dart';
import 'package:bigmannotes/widgets/image_list.dart';
import 'package:bigmannotes/widgets/size_Box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'views/home_page.dart';
import 'widgets/gradientBackground.dart';

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
        decoration: BoxDecoration(gradient: MyGradientBackground()),
        child: Splash(),
      ),
    ),
  );
}
