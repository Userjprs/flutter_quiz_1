import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//void main() {
//  runApp(MyApp());
//}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QUIZ'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[const Color(0xFF417690), const Color(0xFF417690)],
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  quizzes.length,
                  //(index) => ItemWidget(text: 'Item $index'),
                  (index) {
                    final quiz = quizzes[index];
                    final title = quiz['title'] ?? 'Sin title';
                    return ItemWidget(text: title);
                  },
                ),
              ),
            ),
          );
        },
      ),

      /*
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          final quiz = quizzes[index];
          return ListTile(
            title: Text(quiz['titulo'] ?? 'Sin título'),
            subtitle: Text('ID: ${quiz['id']}'),
          );
        },
      ),
      */
    );
  }
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
