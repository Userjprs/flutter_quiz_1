import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiQuestions extends StatefulWidget {
  const ApiQuestions({super.key});

  @override
  State<ApiQuestions> createState() => _ApiQuestionsState();
}

class _ApiQuestionsState extends State<ApiQuestions> {
  List quizzes = [];
  bool cargando = true;
  String? errorMensaje;

  Future<void> obtenerQuizzes() async {
    try {
      final url = Uri.parse('http://10.0.2.2:8000/api/quizzes/');
      final respuesta = await http.get(url);

      if (respuesta.statusCode == 200) {
        final datos = jsonDecode(respuesta.body);
        setState(() {
          quizzes = datos;
          cargando = false;
        });
      } else {
        setState(() {
          errorMensaje = 'Error: ${respuesta.statusCode}';
          cargando = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMensaje = 'No hay conexión con Django';
        cargando = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    //return ElevatedButton(onPressed: onTap, child: Text(text));

    if (cargando) {
      return const Center(
        child: Text(
          'Cargando datos...',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }
    if (errorMensaje != null) {
      return Center(
        child: Text(
          errorMensaje!,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }
    //lista de quiz
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50), //espacio para separar
          const Text(
            'Lista de Quizzes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // lista de quizzes con Django
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
                quizzes.map((quiz) {
                  final title = quiz['title'] ?? 'Sin título';
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    //child: ItemWidget(text: title),
                    //dar acccion botones
                    child: ItemWidget(text: title, onTap: () {}),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text, required this.onTap});

  // dar funcion de boton
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(text));
    /*
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        //child: Text(text, style: const TextStyle(fontSize: 18)),
        child: ElevatedButton(onPressed: onTap, child: Text(text)),
      ),
    );
    */
  }
}
