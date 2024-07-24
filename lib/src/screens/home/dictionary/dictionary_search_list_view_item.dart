import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/controllers/dictionary_controller.dart';
import 'package:geulnarae/src/models/dictionary_search_model.dart';


class DictionarySearchListViewItem extends StatefulWidget {
  final DictionarySearchModel item;
  const DictionarySearchListViewItem(this.item, {super.key});

  @override
  State<DictionarySearchListViewItem> createState() => _DictionarySearchListViewItem();
}

class _DictionarySearchListViewItem extends State<DictionarySearchListViewItem> {
  final dictionaryController = Get.put(DictionaryController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0x33645F5E), // 배경색 설정
          borderRadius: BorderRadius.circular(8.0), // 둥근 모서리 설정
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 단어 이름
            Text(widget.item.word, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

            ...widget.item.sense.map((sense) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 품사, 범주, 분야, 문형, 문법
                  Text('${sense.pos}  ${sense.type} ${sense.cat} ${sense.syntacticArgument} ${sense.syntacticAnnotation}', style: TextStyle(fontSize: 14)),
                  
                  //정의
                  Text('${sense.definition}', style: TextStyle(fontSize: 16))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
