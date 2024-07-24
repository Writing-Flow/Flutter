import 'dart:developer';
import 'package:get/get.dart';
import '../shared/global.dart';
import 'provider.dart';

class QuizProvider extends Provider {

  Future<Map> quiz() async {

    Response response = await get(
      '${Global.baseUrl}/quiz'
    );
    log('response.body : ${response.body}');

    // response.body가 null인 경우를 대비하여 기본 값을 반환
    if (response.body != null && response.body is Map) {
      return response.body;
    } else {
      return {};
    }
  }

  Future<void> quizSave(String nickname, int score) async {

    Response response = await get(
      '${Global.baseUrl}/search',
      query: {'name': '$nickname', 'score': '$score'},
    );
    log('response.status.code : ${response.status.code}');

  }


}