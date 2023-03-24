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
      home: HomePage(),
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

class MyApiWidget extends StatefulWidget {
  @override
  _MyApiWidgetState createState() => _MyApiWidgetState();
}

class _MyApiWidgetState extends State<MyApiWidget> {
  late Future<List<dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = _fetchData();
  }

  Future<List<dynamic>> _fetchData() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?_start=0&_limit=10'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Example'),
        backgroundColor: const Color.fromRGBO(55, 48, 107, 1),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ListTile(
                  leading: Image.network(item['thumbnailUrl']),
                  title: Text(item['title']),
                  subtitle: Text('ID: ${item['id']}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
