import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/my_page_controller.dart';


class MyWritingListViewItem extends StatefulWidget {
  final Map item;
  const MyWritingListViewItem(this.item, {super.key});

  @override
  State<MyWritingListViewItem> createState() => _MyWritingListViewItemState();
}

class _MyWritingListViewItemState extends State<MyWritingListViewItem> {
  final myPageController = Get.put(MyPageController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      child: Container(
        margin: const EdgeInsets.all(3.0),
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
          color: Color(0x33645F5E), // 배경색 설정
          borderRadius: BorderRadius.circular(8.0), // 둥근 모서리 설정
        ),
        child: Stack(
          children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child:
                     Column(
                       mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.item['title'], style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis),
                          Text(widget.item['main'] , softWrap: true, overflow: TextOverflow.visible , maxLines: 5, ),
                        ],
                      ),
                 ),
                 IconButton(onPressed: (){
                   myPageController.deleteMyWriting(widget.item['id']);
                 }, icon: Icon(Icons.delete, color: Colors.grey, size: 16))
               ],
             ),

          ],
        ),
      ),
    );
  }
}
