import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/controllers/my_page_controller.dart';
import 'package:geulnarae/src/screens/home/my/my_writing_list_view_item.dart';

class MyWritingTap extends StatefulWidget {
  const MyWritingTap({super.key});

  @override
  State<MyWritingTap> createState() => _MyWritingTapState();
}

class _MyWritingTapState extends State<MyWritingTap> {
  final myPageController = Get.put(MyPageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Expanded(
            child: Obx(() =>
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: myPageController.myWritingList.length,
                    itemBuilder: (context, index) {
                      return MyWritingListViewItem(myPageController.myWritingList[index]);
                    }
                ),
            ),
          ),
        ],
      ),
    );
  }
}
