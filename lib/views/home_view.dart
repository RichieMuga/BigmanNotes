import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BIGMAN NOTES"),
        backgroundColor: Color.fromRGBO(55, 48, 107, 1),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              // print(FirebaseAuth.instance.currentUser);
              if (FirebaseAuth.instance.currentUser?.emailVerified == false) {
                print("You have not verified");
              } else {
                // Get.to();
                print("My guy you are verified");
              }
              return const Text("data");
            default:
              return const Text("loading");
          }
        },
      ),
    );
  }
}
