import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/color/app_colors.dart';
import '../../../controllers/writing_controller.dart';

class WritingMoreBottom extends StatelessWidget {
  // 컨트롤러 가져오기
  final WritingController controller = Get.find<WritingController>();

  final VoidCallback cancelTap;
  WritingMoreBottom({required this.cancelTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ListTile(leading: Icon(Icons.ios_share_rounded), title: Text('글 공유하기')),
                ListTile(leading: Icon(Icons.search), title: Text('사전 찾기')),
                ListTile(leading: Icon(Icons.delete),title: Text('내용 다 지우기'), textColor: AppColors.color_3,
                  onTap: (){
                    controller.setTextDelete();
                    cancelTap();
                  }
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text('닫기', textAlign: TextAlign.center),
                onTap: cancelTap
              )
          )
        ],
      ),
    );
  }
}
