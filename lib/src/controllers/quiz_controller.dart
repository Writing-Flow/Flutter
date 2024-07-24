import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:geulnarae/src/models/quiz_model.dart';
import 'package:geulnarae/src/screens/home/quiz/do_quiz.dart';
import 'package:geulnarae/src/screens/home/quiz/quiz_result.dart';

import '../providers/quiz_provider.dart';
import '../shared/global.dart';

class QuizController extends GetxController {
  RxInt myQuizNum = 0.obs;                        // quiz intro 변수 제어
  RxInt myRank = 0.obs;

  List<QuizModel> quizList = <QuizModel>[]; // 퀴즈 요청 리스트
  var currentQuestionIndex = 0.obs;               // 현재 퀴즈 페이지 제어

  TextEditingController answerController = TextEditingController(); // 답안 controller
  RxList answerList = [].obs;   // 답안 List
  RxList quizResult = [].obs;   // 퀴즈 결과
  RxInt answerCount = 0.obs;      // 정답 수 count

  @override
  void onInit() {
    super.onInit();
    _initialData();
  }

  Future<void> _initialData() async {
  }

  void quizRequest() async {
    Map json =  await QuizProvider().quiz(); // 퀴즈 요청

    if(json.isNotEmpty) {
      List<QuizModel> tmp = json['questions'].map<QuizModel>((m) =>
          QuizModel.parse(m)).toList();

      quizList.clear();
      quizList.assignAll(tmp);
    }
    // 이전 단계에서 퀴즈 풀다가 중단했을 시 대비 초기화
    currentQuestionIndex = 0.obs;
    answerCount = 0.obs;
    answerList.clear();
    quizResult.clear();
    answerController.clear();

    Get.to(() => DoQuiz());
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < quizList.length - 1) {
      answerList.add(answerController.text);
      answerController.clear();
      currentQuestionIndex.value++;
      Get.to(() => DoQuiz());
      log('ans : $answerList');
    }
    else{ // 마지막 페이지 인 경우
      log('마지막 페이지 입니다');
      answerList.add(answerController.text);
      answerController.clear();
      grade();
      Get.to(() => QuizResult());
    }
  }

  // 채점
  void grade() async{

    for(int i = 0; i < quizList.length; i++){
      // 퀴즈 리스트와 답안 문자열 비교
      String cleanedString1 = answerList[i].replaceAll(RegExp(r'[\^-]'), '');
      String cleanedString2 = quizList[i].word.replaceAll(RegExp(r'[\^-]'), '');
      if(cleanedString2.compareTo(cleanedString1) == 0){
        quizResult.add(true);
        answerCount++;
      }else{
        quizResult.add(false);
      }
    }
    // 내가 맞춘 문제 수
    myQuizNum += answerCount.toInt();
    await QuizProvider().quizSave(Global.nickName, answerCount.toInt());
  }

}
