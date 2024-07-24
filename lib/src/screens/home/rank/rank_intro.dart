import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/screens/home/rank/rank_list_item.dart';
import '../../../controllers/quiz_controller.dart';

class RankIntro extends StatefulWidget {
  const RankIntro({super.key});

  @override
  State<RankIntro> createState() => _RankIntro();
}

class _RankIntro extends State<RankIntro> {
  final quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('랭킹')
      ),

      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: quizController.rankList.length,
                itemBuilder: (context, index){
                  return RankListItem(quizController.rankList[index], index + 1);
                },
              )
          )
        ],
      ),
    );
  }
}
