import 'package:flutter/material.dart';

//(paso 2) Texto que se mostrará en pantalla
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //centrar texto
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300),
          const SizedBox(height: 80), // espacio entre imagen y texto
          const Text(
            'Aprendiendo programacion',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 30), // espacio entre texto y boton
          // boton Start Quiz
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt), //flecha dentro del boton
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            //onPressed: () {},
            onPressed: startQuiz,

            //child: const Text('Start Quiz'),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
