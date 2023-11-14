import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuizz, {super.key});

  final void Function() startQuizz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
              ),
              'Learn Flutter The Fun Way',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: OutlinedButton.icon(
              onPressed: startQuizz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Start Quizz'),
              icon: const Icon(Icons.arrow_right_alt),
            ),
          )
        ],
      ),
    );
  }
}
