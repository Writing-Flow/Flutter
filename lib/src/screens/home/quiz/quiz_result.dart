import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/screens/home/quiz/quiz_result_item.dart';

import '../../../controllers/quiz_controller.dart';
import '../home.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({super.key});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  final quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => Home());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title:Text('퀴즈 결과')
        ),

        body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: quizController.quizList.length,
                    itemBuilder: (context, index){
                      return QuizResultItem(quizController.quizList[index], quizController.quizResult[index]);
                    },
                  )
              )
            ],
          ),
      ),
    );
  }
}
