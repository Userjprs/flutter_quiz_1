import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyApprueba extends StatelessWidget {
  const MyApprueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Quizzes API', home: QuizPage());
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List quizzes = [];

  Future<void> obtenerQuizzes() async {
    final url = Uri.parse(
      'http://10.0.2.2:8000/api/quizzes/',
    ); // usa 10.0.2.2 en emulador
    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      final datos = jsonDecode(respuesta.body);
      setState(() {
        quizzes = datos;
      });
    } else {
      print('Error: ${respuesta.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerQuizzes();
  }



class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    //return Card(child: SizedBox(height: 50, child: Center(child: Text(text))));
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
