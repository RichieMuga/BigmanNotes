import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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
            return const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
