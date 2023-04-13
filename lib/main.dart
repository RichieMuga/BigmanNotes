// import 'package:bigmannotes/views/home_view.dart';
import 'dart:convert';

import 'package:bigmannotes/views/home_page.dart';
import 'package:bigmannotes/views/login_view.dart';
import 'package:bigmannotes/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'views/splash_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}

enum MenuAction { logout }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BIGMAN NOTES"),
        backgroundColor: const Color.fromRGBO(55, 48, 107, 1),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogOut = await show_logout_dialogue(context);
                  devtools.log(shouldLogOut.toString());
                  if (shouldLogOut){
                    FirebaseAuth.instance.signOut();
                    Get.offAll(() =>()=> const LoginView());
                  }
              }
            },
            itemBuilder: (context) {
              MenuAction.logout;
              return [
                const PopupMenuItem(
                  value: MenuAction.logout,
                  child: Text('Logout'),
                )
              ];
            },
          )
        ],
      ),
      body: Text('hi motherfucker'),
    );
  }
}

Future<bool> show_logout_dialogue(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back(result: false);
                },
                child: const Text("Cancel")),
            TextButton(onPressed: () {}, child: const Text("Logout"))
          ],
        );
      }).then((value) => value ?? false);
}
