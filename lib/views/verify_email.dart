import 'dart:async';

import 'package:bigmannotes/main.dart';
import 'package:bigmannotes/views/home_page.dart';
import 'package:bigmannotes/views/testingAPI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';

// class VerifyEmail extends StatelessWidget {
//   const VerifyEmail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("BIGMAN NOTES"),
//         backgroundColor: const Color.fromRGBO(55, 48, 107, 1),
//       ),
//       body: FutureBuilder(
//         future: Firebase.initializeApp(
//           options: DefaultFirebaseOptions.currentPlatform,
//         ),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.done:
//               // print(FirebaseAuth.instance.currentUser);
//               // if (FirebaseAuth.instance.currentUser?.emailVerified == false) {
//               //   return const Text("You have not verified");
//               // } else {
//               //   return const Text("My guy you are verified");
//               // }

//             default:
//               return const Text("loading");
//           }
//         },
//       ),
//     );
//   }
// }

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  late StreamSubscription<User?> _authStateChangesSubscription;

  @override
  void initState() {
    super.initState();
    // Listen to the user's authentication state changes
    _authStateChangesSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null && user.emailVerified) {
        // Redirect the user to the next page
        Get.to(() => const MainPage());
      }
    });
  }

  @override
  void dispose() {
    // Cancel the subscription when the widget is disposed
    _authStateChangesSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Please verify your email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    if (user.emailVerified) {
                      // If the user's email is already verified, redirect them to the next page
                      Get.to(() =>const MainPage());
                    } else {
                      await user.sendEmailVerification();
                      Get.snackbar(
                        "Verification email sent",
                        "Please check your inbox",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.purple,
                        colorText: Colors.white,
                      );
                    }
                  }
                },
                child: const Text("Send verification email"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
