import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:geulnarae/src/sqlite_db/search_history_db.dart';

import '../../../controllers/dictionary_controller.dart';
import 'category_button.dart';

class DictionarySearch extends StatefulWidget {
  const DictionarySearch({super.key});

  @override
  State<DictionarySearch> createState() => _DictionarySearchState();
}

class _DictionarySearchState extends State<DictionarySearch> {
  final dictionaryController = Get.put(DictionaryController());

  List<Map<String, dynamic>> searchString = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        centerTitle: false,

      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryButton(searchString: '중고차',), SizedBox(width: 11),
                CategoryButton(searchString: '중고차',), SizedBox(width: 12),
                CategoryButton(searchString: '중고차',), SizedBox(width: 12),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

