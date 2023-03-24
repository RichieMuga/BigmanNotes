import 'package:bigmannotes/views/register_view.dart';
import 'package:bigmannotes/views/testingAPI.dart';
import 'package:bigmannotes/views/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';
import '../main.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    // DONE: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // DONE: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color.fromRGBO(55, 48, 107, 1),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _email,
                      decoration:
                          const InputDecoration(hintText: "Enter email"),
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: _password,
                      decoration:
                          const InputDecoration(hintText: "Enter password"),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final email = _email.text;
                          final password = _password.text;
                          try {
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email, password: password);
                            final userCred = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email, password: password);
                            print(userCred);
                            if (FirebaseAuth
                                    .instance.currentUser?.emailVerified ==
                                false) {
                              Get.to(() => const VerifyEmail());
                            } else {
                              // print("My guy you are verified");
                              Get.offAll(() => MyApiWidget());
                            }
                            // await Get.to(() => const ParseJson());
                          } on FirebaseAuthException catch (e) {
                            if (e.code == "user-not-found") {
                              print("Account does not exist");
                            } else if (e.code == "wrong-password") {
                              print("wrong password!");
                            } else if (e.code == "invalid-email") {
                              print("Invalid email!");
                            }
                          }
                        },
                        child: const Text("Login"),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(55, 48, 107, 1),
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(() => RegisterView());
                      },
                      child: Text(
                        "Not registered? Register here!",
                        style: TextStyle(
                          color: const Color.fromRGBO(55, 48, 107, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const Text("loading");
          }
        },
      ),
    );
  }
}
