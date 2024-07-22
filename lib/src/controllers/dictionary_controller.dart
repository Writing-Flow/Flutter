import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:geulnarae/src/sqlite_db/search_history_db.dart';
import '../screens/home/dictionary/category_button.dart';

class DictionaryController extends GetxController {
  RxList<CategoryButton> categoryButtonList = <CategoryButton>[].obs; // 검색 기록 리스트 controller
  TextEditingController searchTextController = TextEditingController(); // 검색 문자열 controller

  @override
  void onInit() {
    super.onInit();
    _initialData();
  }

  Future<void> _initialData() async {
    await searchHistorySyn(); // 초기 데이터 로드
  }

  // 검색 기록 추가
  Future<void> addSearchHistory() async {
    if (searchTextController.text.isNotEmpty) {
      await SearchHistoryDb.insertSearchHistory(searchTextController.text);
      searchTextController.clear(); // 입력 필드 초기화
    }
    await searchHistorySyn(); // 동기화
  }

  // 검색 기록 삭제
  Future<void> deleteSearchHistory(String string) async {
    await SearchHistoryDb.deleteSearchHistory(string);
    await searchHistorySyn(); // 동기화
  }

  // 검색목록 동기화
  Future<void> searchHistorySyn() async {
    List<Map<String, dynamic>> searchHistoryList = await SearchHistoryDb.selectAll();

    List<String> searchStrings = searchHistoryList.map((row) => row['searchstring'] as String).toList();

    categoryButtonList.assignAll(searchStrings.map((string) => CategoryButton(
      onTap: () async {
        await deleteSearchHistory(string);
      },
      searchString: string,
    )).toList());

  }
}
