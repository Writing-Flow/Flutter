import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geulnarae/src/color/app_colors.dart';
import 'package:geulnarae/src/sqlite_db/writing_db.dart';
import '../../../controllers/writing_controller.dart';
import 'writing_more_bottom.dart';

class DoWriting extends StatefulWidget {
  const DoWriting({super.key});

  @override
  State<DoWriting> createState() => _DoWritingState();
}

class _DoWritingState extends State<DoWriting> {
  // 컨트롤러 가져오기
  final WritingController _controller = Get.put(WritingController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바
      appBar: AppBar(
        centerTitle: false,
        title: const Text('글쓰기'),
        actions: [

            IconButton(onPressed: (){
              WritingDb.insertWriting(_controller.titleTextController.text, _controller.mainTextController.text);
              _controller.isWriting.value = true;
              Get.back();
            }, icon: Icon(Icons.save_alt_rounded)),

          IconButton(onPressed: (){
            showModalBottomSheet(
              context: context,
              builder: (builder){
                return WritingMoreBottom(cancelTap: (){
                  Get.back();
                },);
              }
            );
          }, icon: const Icon(Icons.more_vert)),
        ],
      ),

      // 제목, 본문
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // 주제
              TextField(
                controller: _controller.titleTextController,
                decoration: InputDecoration(
                  hintText: '오늘의 단어는',
                ),
              ),


            // 본문, 나머지 영역 채우기(아직 해결 못함)
            Expanded(
              child: Obx(
                () => TextField(
                  controller: _controller.mainTextController, // text 변화 감지 컨트롤러 연결
                  // minLines: 10,
                  maxLines: 10,                       // null = 라인 자동 설정
                  maxLength: _controller.maxLength,
                  decoration: InputDecoration(
                    // border: InputBorder.none,        // 테두리 없음
                    hintText: '''
오늘의 단어는 마감입니다.
어떻게 글을 작성해야 할지 모를 땐 잠시 다른 생각도 해보세요.

오늘 창문 밖 날씨는 어떤가요?
오늘은 어떤 하루였나요?

작성한 글은 라운지에 공유할 수도 안 할 수도 있습니다.

모든 건 여러분의 마음대로입니다.
''',
                    counter: Text(
                      '${_controller.currentLength.value} / ${_controller.maxLength}',
                      style: const TextStyle(color: AppColors.color_1),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
