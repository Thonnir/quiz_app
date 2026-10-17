class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;

  /// The first answer is always the correct one.
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
