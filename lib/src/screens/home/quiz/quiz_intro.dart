import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/controllers/quiz_controller.dart';


class QuizIntro extends StatefulWidget {
  const QuizIntro({super.key});

  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
  final quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx( () =>
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('내가 맞춘 문제 수', style: TextStyle(fontSize: 21)),
              Text('${quizController.myQuizNum}개', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 40),
              Text('나는', style: TextStyle(fontSize: 21)),
              Text('${quizController.myRank}위', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: quizController.quizRequest,
                child: Text('퀴즈 시작하기'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: quizController.rankRequest,
                child: Text('랭킹보기')
              ),

            ],
          ),
        ),
      ),
    );
  }
}
