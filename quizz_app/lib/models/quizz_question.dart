class QuizzQuestion {
  const QuizzQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffeledAnswers {
    final shuffeledList = List.of(answers);
    shuffeledList.shuffle();
    return shuffeledList;
  }
}
