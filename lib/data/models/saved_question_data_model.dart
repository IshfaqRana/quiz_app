class SavedResult {
  SavedResult({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
    this.selectedAnswer,
  });

  final String? category;
  final String? type;
  final String? difficulty;
  final String? question;
  final String? correctAnswer;
  final List<String>? incorrectAnswers;
  final String? selectedAnswer;
}
