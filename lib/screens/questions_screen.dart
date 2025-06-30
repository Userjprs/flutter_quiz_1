import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';

// paso 3 mostrar las preguntas en pantalla
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    // llamar las preguntas
    final currentQuestion = questions[0]; //aqui vamos
    //return const Text('Questions Screen');
    return Center(
      //child: Text('Questions Screen'));
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The question...'),
          const SizedBox(height: 30),
          // llamar a la clase AnswerButton
          AnswerButton(text: 'Answer1', onTap: () {}),
          AnswerButton(text: 'Answer2', onTap: () {}),
          AnswerButton(text: 'Answer3', onTap: () {}),
        ],
      ),
    );
  }
}
