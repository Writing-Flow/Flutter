import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/quiz_controller.dart';

class DoQuiz extends StatelessWidget {
  final QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('퀴즈')
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 답 입력
            TextField(
              controller: quizController.answerController,
              decoration: InputDecoration(
                labelText: '정답을 입력하세요',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // 뜻 보여주기
            Obx(() => Text(
              '뜻: ${quizController.quizList[quizController.currentQuestionIndex.toInt()].definition}',
              style: TextStyle(fontSize: 18),
            )),
            SizedBox(height: 50),


            ElevatedButton(
              onPressed: () {
                quizController.nextQuestion();
              },
              child: Text('다음'),
            ),
          ],
        ),
      ),
    );
  }
}



