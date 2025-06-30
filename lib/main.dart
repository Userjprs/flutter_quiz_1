//import 'package:flutter/material.dart';
//import 'package:flutter_quiz/pages/counter.dart';
//import 'package:flutter_quiz/pages/prueba.dart';
//import 'package:flutter_quiz/pages/questions.dart';
//import 'package:flutter_quiz/pages/counter.dart';
//import 'package:flutter_quiz/pages/search_pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz.dart';
//import 'package:flutter_quiz/screens/start_screen.dart';

void main() {
  //runApp(const MyApp());
  //runApp(MyApprueba());
  //runApp(const FlutterSearch());
  /*
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizQuestions(quizId: 1), // Cambia el id si hace falta
    ),
  );
  */
  // clase principal (paso 1)
  runApp(const Quiz());
}

/*
class FlutterSearch extends StatefulWidget {
  const FlutterSearch({super.key});

  @override
  State<FlutterSearch> createState() => _FlutterSearchState();
}

class _FlutterSearchState extends State<FlutterSearch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SearchPage());
  }
}
*/
