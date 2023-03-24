import 'dart:convert';

import 'package:flutter/material.dart';

import 'album.dart';

import 'package:http/http.dart' as http;


class ParseJson extends StatelessWidget {
  const ParseJson({super.key});

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
    Future<List<Post>> getPost() async {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((post) => Post.fromJson(post)).toList();
      } else {
        print("Request failed with status: ${response.statusCode}.");
        throw "Reading failed";
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Parsing json from server"),
          backgroundColor:const Color.fromRGBO(55, 48, 107, 1),
        ),
        body: FutureBuilder(
          future: getPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post>? data = snapshot.data as List<Post>?;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index].title),
                      subtitle: Text(data[index].body),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
