import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quiz/SearchService.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
  //_SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResults = [];

  searchDjango(value) async {
    SearchService.searchDjangoApi(value).then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      setState(() {
        data.forEach((value) {
          searchResults.add(value);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build function: ${searchResults.toString()}");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [ElevatedButton(onPressed: () {}, child: Text('Quiz'))],
          title: Text("Django administration"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.blue, Colors.blue],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
