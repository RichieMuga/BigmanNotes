import 'dart:convert';

import 'package:bigmannotes/views/album.dart';
import 'package:bigmannotes/views/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Color(0xFF6D478C),
          )),
      home: Container(
        decoration: BoxDecoration(gradient: MyGradientBackground()),
        child: VerifyEmail(),
      ),
    ),
  );
}

