import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritingController extends GetxController {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController mainTextController = TextEditingController();
  final RxInt currentLength = 0.obs;  // 현재 입력된 글자 수
  final int maxLength = 500;          // 최대 글자 수
  final RxBool isWriting = false.obs;       // 오늘 글쓰기를 작성 했는지 여부

  @override
  void onInit() {
    super.onInit();
    // 텍스트 변경 리스너
    mainTextController.addListener(() {
      currentLength.value = mainTextController.text.length;
    });
  }

  // 본문 text 모두지우기
  void setTextDelete(){
    mainTextController.text = '';
  }

}