class RankModel {
  late String name;
  late int score;

  RankModel({
    required this.name,
    required this.score,
  });

  RankModel.parse(Map m) {
    name = m['name'] ?? '';
    score = m['score'] ?? '';
  }
}
