
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
    );
  }
}
