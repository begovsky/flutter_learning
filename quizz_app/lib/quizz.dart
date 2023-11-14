import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/results_screen.dart';
import 'start_screen.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizzState();
  }
}

class _QuizzState extends State<Quizz> {
  final List<int> submitedAnswersIndexes = [];
  var activeScreen = ScreenType.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = ScreenType.questionsScreen;
    });
  }

  void restartQuizz() {
    submitedAnswersIndexes.clear();
    setState(() {
      activeScreen = ScreenType.startScreen;
    });
  }

  void submitAnswer(int index) {
    submitedAnswersIndexes.add(index);

    if (submitedAnswersIndexes.length == questions.length) {
      setState(() {
        activeScreen = ScreenType.resultsScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == ScreenType.startScreen
    //           ? StartScreen(switchScreen)
    //           : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == ScreenType.questionsScreen) {
      screenWidget = QuestionsScreen(
        onSubmitAnswer: submitAnswer,
      );
    }

    if (activeScreen == ScreenType.resultsScreen) {
      screenWidget = ResultsScreen(
        submitedAnswersIndexes: submitedAnswersIndexes,
        onRestartQuizz: restartQuizz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.purple,
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

enum ScreenType { startScreen, questionsScreen, resultsScreen }
