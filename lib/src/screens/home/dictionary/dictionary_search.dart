import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/screens/home/dictionary/dictionary_search_list_view_item.dart';
import '../../../controllers/dictionary_controller.dart';
import '../../../models/dictionary_search_model.dart';
import '../../../providers/dictionary_provider.dart';

class DictionarySearch extends StatefulWidget {
  const DictionarySearch({super.key});

  @override
  State<DictionarySearch> createState() => _DictionarySearchState();
}

class _DictionarySearchState extends State<DictionarySearch> {
  final dictionaryController = Get.put(DictionaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () async {
            log('구간2: ${dictionaryController.searchTextController.text} ');
            Map json =  await DictionaryProvider().search(dictionaryController.searchTextController.text); // 검색
            if(json.isNotEmpty){
              List<DictionarySearchModel> tmp = json['data'].map<DictionarySearchModel>((m) =>
                  DictionarySearchModel.parse(m)).toList();

              dictionaryController.searchResultList.clear();
              dictionaryController.searchResultList.assignAll(tmp);
            }

            await dictionaryController.addSearchHistory();  // 검색 기록
          },
        ),
        title: TextField(
          controller: dictionaryController.searchTextController,
          decoration: InputDecoration(
            hintText: '검색어를 입력하세요', // 힌트 문자열
            border: InputBorder.none,
          ),
          onTap: () {
            // 텍스트 필드에 포커스가 갔을 때 상태를 변경하기 위한 액션
            // 이 경우는 상태를 변경하는 로직을 추가할 수 있습니다.
          },
        ),

      ),

      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: Obx(() =>
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dictionaryController.categoryButtonList.length,
                itemBuilder: (context, index) {
                  return dictionaryController.categoryButtonList[index];
                }
              ),
            ),
          ),
          // 검색 결과 리스트
          Expanded(
            child: Obx(() =>
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dictionaryController.searchResultList.length,
                itemBuilder: (context, index){
                  return DictionarySearchListViewItem(dictionaryController.searchResultList[index]);
                },
              )
            )
          )
        ],
      ),
    );
  }
}

