class DictionarySearchModel {
  late String word;
  late List<DictionarySenseModel> sense;

  DictionarySearchModel({
    required this.word,
    required this.sense,
  });

  DictionarySearchModel.parse(Map<String, dynamic> m) {
    word = m['word'];
    if (m['sense'] != null) {
      sense = List<DictionarySenseModel>.from(
        m['sense'].map((senseMap) => DictionarySenseModel.parse(senseMap)),
      );
    } else {
      sense = [];
    }
  }
}

class DictionarySenseModel {
  late String syntacticArgument;    // 문형
  late String syntacticAnnotation;  // 문법
  late String cat;                  // 전문분야
  late String definition;           // 뜻풀이
  late String link;                 // 사전 내용 보기 URL
  late String origin;               // 원어
  late String sense_no;             // 의미번호(3자리 정수)
  late String target_code;          // 대상 코드
  late String type;                 // 범주(일반어, 지역어, 북한어, 옛말)
  late String pos;                  // 품사

  DictionarySenseModel({
    required this.syntacticArgument,
    required this.syntacticAnnotation,
    required this.cat,
    required this.definition,
    required this.link,
    required this.origin,
    required this.sense_no,
    required this.target_code,
    required this.type,
    required this.pos,
  });

  DictionarySenseModel.parse(Map<String, dynamic> m) {
    syntacticArgument = m['syntacticArgument'] ?? '';
    syntacticAnnotation = m['syntacticAnnotation'] ?? '';
    cat = m['cat'] ?? '';
    definition = m['definition'] ?? '';
    link = m['link'] ?? '';
    origin = m['origin'] ?? '';
    sense_no = m['sense_no'] ?? '';
    target_code = m['target_code'] ?? '';
    type = m['type'] ?? '';
    pos = m['pos'] ?? '';
  }
}
