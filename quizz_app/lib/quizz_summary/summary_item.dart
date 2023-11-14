import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/quizz_summary/question_indicator.dart';

class SummaryItem extends StatelessWidget {
  SummaryItem(this.data, {super.key});

  Map<String, Object> data;

  bool isAnswerCorrect(Map<String, Object> data) {
    return data['correct_answer'] == data['user_answer'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIndicator(
              isCorrectAnswer: isAnswerCorrect(data),
              questionNum: (data['question_index'] as int) + 1),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'] as String,
                  style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data['user_answer'] as String,
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 77, 21, 173)),
                ),
                Text(
                  data['correct_answer'] as String,
                  style: GoogleFonts.lato(color: Colors.blue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
