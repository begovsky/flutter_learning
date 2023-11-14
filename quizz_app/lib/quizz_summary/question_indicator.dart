import 'package:flutter/material.dart';

class QuestionIndicator extends StatelessWidget {
  const QuestionIndicator(
      {super.key, required this.isCorrectAnswer, required this.questionNum});

  final bool isCorrectAnswer;
  final int questionNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? Colors.blue
            : const Color.fromARGB(255, 145, 94, 232),
        shape: BoxShape.circle,
        border: Border.all(width: 1),
      ),
      child: Center(
        child: Text(questionNum.toString()),
      ),
    );
  }
}
