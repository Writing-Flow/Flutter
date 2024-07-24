import 'package:flutter/material.dart';
import 'package:geulnarae/src/models/rank_model.dart';

class RankListItem extends StatefulWidget {
  final RankModel item;
  final int rankingNum;

  const RankListItem(this.item, this.rankingNum, {super.key});

  @override
  State<RankListItem> createState() => _RankListItem();
}

class _RankListItem extends State<RankListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 항목 클릭 시 동작
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),  // 여백 설정
        padding: const EdgeInsets.all(13.0), // 내부 여백 설정
        decoration: BoxDecoration(
          color: Color(0xFF645F5E), // 배경색 설정
          borderRadius: BorderRadius.circular(8.0), // 둥근 모서리 설정
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.rankingNum.toString(), style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),

            Text(widget.item.name, style: TextStyle(color: Colors.white)),

            Text('${widget.item.score}점', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
