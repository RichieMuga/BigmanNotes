import 'package:bigmannotes/main.dart';
import 'package:bigmannotes/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    // Already did: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Already did: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _email,
                    decoration: const InputDecoration(hintText: "Enter email"),
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
                          final userCred = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password);
                          print(userCred);
                          Get.offAll(() => const LoginView());
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "weak-password") {
                            print("Weak password");
                          } else if (e.code == "email-already-in-use") {
                            print("Email already in use");
                          }
                        }
                      },
                      child: const Text("Register"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(55, 48, 107, 1),
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(() => const LoginView());
                    },
                    child: Text(
                      "Not logged in? Login here!",
                      style: TextStyle(
                        color: const Color.fromRGBO(55, 48, 107, 1),
                      ),
                    ),
                  ),
                ],
              );
              // return const Text("done");
            default:
              return const Text("loading");
          }
        },
      ),
    );
  }
}
