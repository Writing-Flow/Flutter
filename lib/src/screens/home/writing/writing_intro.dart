import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:geulnarae/src/screens/home/writing/do_writing.dart';

import '../../../controllers/writing_controller.dart';

class WritingIntro extends StatefulWidget {

  WritingIntro({super.key});

  @override
  State<WritingIntro> createState() => _WritingIntroState();
}

class _WritingIntroState extends State<WritingIntro> {
  // 컨트롤러 가져오기
  final WritingController _controller = Get.put(WritingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 본문
      body: Obx(() =>
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('오늘의 단어', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(_controller.isWriting.value)...[
                    Icon(Icons.check_circle)
                  ],
                  const SizedBox(width: 5),
                  Text('마감', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ),

      // 플로팅 액션 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(() => const DoWriting());
        },
        child: const Icon(Icons.mode_edit_outlined, color: Colors.white),
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
      )
    );
  }
}
