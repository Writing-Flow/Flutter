
import 'package:flutter/material.dart';
import 'package:geulnarae/src/models/quiz_model.dart';

class QuizResultItem extends StatefulWidget {
  final QuizModel item;
  final bool result;

  const QuizResultItem(this.item, this.result, {super.key});

  @override
  State<QuizResultItem> createState() => _QuizResultItem();
}

class _QuizResultItem extends State<QuizResultItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),  // 여백 설정
        padding: const EdgeInsets.all(13.0), // 내부 여백 설정
        decoration: BoxDecoration(
          color: Color(0x44645F5E), // 배경색 설정
          borderRadius: BorderRadius.circular(8.0), // 둥근 모서리 설정
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 단어 이름, 정답 유무
                  Text(widget.item.word, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                  Icon(widget.result ? Icons.check_circle : Icons.cancel,
                      color: widget.result ? Colors.green : Colors.red)
                ]
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(widget.item.definition),
              )

            ],
          ),
        ),
      ),
    );
  }
}
