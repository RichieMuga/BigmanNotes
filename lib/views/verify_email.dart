import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BIGMAN NOTES"),
        backgroundColor: const Color.fromRGBO(55, 48, 107, 1),
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
                return const Text("You have not verified");
              } else {
                return const Text("My guy you are verified");
              }

            default:
              return const Text("loading");
          }
        },
      ),
    );
  }
}
