import 'package:bigmannotes/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Verify your email"),
        ),
        body: Column(
          children: [
            const Text("Please verify your email"),
            TextButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    if (user.emailVerified) {
                      return Get.offAll(() => const DashBoard());
                    }
                  }
                  await user?.sendEmailVerification();
                  if (FirebaseAuth.instance.currentUser?.emailVerified ==
                      false) {
                    Get.offAll(() => const VerifyEmail());
                  } else {
                    // print("My guy you are verified");
                    Get.offAll(() => const DashBoard());
                  }
                },
                child: const Text("Send verification email"))
          ],
        ));
  }
}
