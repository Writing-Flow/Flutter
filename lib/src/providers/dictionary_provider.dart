import 'dart:developer';

import 'package:get/get.dart';
import 'package:geulnarae/src/shared/global.dart';
import 'provider.dart';

class DictionaryProvider extends Provider {

  Future<Map> search(String word) async {
    log('통신 직전 검색어 : $word');
    Response response = await get(
      '${Global.baseUrl}/search',
      query: {'word': '$word'},
    );
    log('response.body : ${response.body}');

    // response.body가 null인 경우를 대비하여 기본 값을 반환
    if (response.body != null && response.body is Map) {
      return response.body;
    } else {
      return {};
    }
  }
}