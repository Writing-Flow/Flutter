import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritingController extends GetxController {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController mainTextController = TextEditingController();
  final RxInt currentLength = 0.obs;  // 현재 입력된 글자 수
  final int maxLength = 500;          // 최대 글자 수

  @override
  void onInit() {
    super.onInit();
    // 텍스트 변경 리스너
    mainTextController.addListener(() {
      currentLength.value = mainTextController.text.length;
    });
  }

  void setTextDelete(){
    mainTextController.text = '';
  }
}