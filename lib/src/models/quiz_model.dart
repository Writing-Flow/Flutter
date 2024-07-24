class QuizModel {
  late String word;
  late String definition;

  QuizModel({
    required this.word,
    required this.definition,
  });

  QuizModel.parse(Map m) {
    word = m['word'] ?? '';
    definition = m['definition'] ?? '';
  }
}
