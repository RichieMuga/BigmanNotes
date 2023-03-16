import 'dart:convert';

import 'package:bigmannotes/views/album.dart';
import 'package:bigmannotes/views/login_view.dart';
import 'package:bigmannotes/views/register_view.dart';
import 'package:bigmannotes/views/splash_screen.dart';
import 'package:bigmannotes/widgets/image_list.dart';
import 'package:bigmannotes/widgets/size_Box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'views/home_page.dart';
import 'widgets/gradientBackground.dart';
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
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Color(0xFF6D478C),
          )),
      home: Container(
        decoration: BoxDecoration(gradient: MyGradientBackground()),
        child: LandingPage(),
      ),
    ),
  );
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // getPosts() async{
    //   var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    //   var jsonData = jsonDecode(response.body);
    //   List<Post> posts = [];
    //   for(var p in jsonData){
    //     Post post = Post(p["title"], p["body"], p["userId"], p["id"]);
    //     posts.add(post);
    //   }
    //   print(posts.length);
    // }

    getPost<Post>() async {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        // var jsonResponse = convert.jsonDecode(response.body);
        List jsonResponse = json.decode(response.body);
        jsonResponse.map((posts) => {
          // Post.fromJson(posts)
        });
      }
      else {
        print("Request failed with status: ${response.statusCode}.");
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Parsing json from server"),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Column(children: [])));
  }
}
