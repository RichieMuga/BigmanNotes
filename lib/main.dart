import 'package:bigmannotes/views/home_view.dart';
import 'package:bigmannotes/views/login_view.dart';
import 'package:bigmannotes/views/register_view.dart';
import 'package:bigmannotes/views/splash_screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'views/splash_screen.dart';

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
      home: const SplashScreen(),
    ),
  );
}

// class VerifyEmail extends StatefulWidget {
//   const VerifyEmail({super.key});

//   @override
//   State<VerifyEmail> createState() => _VerifyEmailState();
// }

// class _VerifyEmailState extends State<VerifyEmail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Verify your email"),
//         ),
//         body: Column(
//           children: [
//             const Text("Please verify your email"),
//             TextButton(
//                 onPressed: () async {
//                   final user = FirebaseAuth.instance.currentUser;
//                   // print(user);
//                   await user?.sendEmailVerification();
//                 },
//                 child: const Text("Send verification email"))
//           ],
//         ));
//   }
// }

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
