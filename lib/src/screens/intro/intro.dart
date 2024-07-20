import 'dart:ui';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            // 로고&슬로건 영역
            Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 로고
                      Image.asset('asset/images/intro/intro_logo.png', width: 150, height: 197),
                      // 슬로건

                      const Text('머리 속에 떠돌던 생각을\n 작성해보시겠습니까?', textAlign: TextAlign.center)
                    ],
                  ),
                )),
            // 가입, 로그인 버튼 영역
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // 회원가입
                      ElevatedButton(
                          onPressed: (){
                            //Get.to(() => const Register());
                          },
                          child: const Text('가입하기')
                      ),
                      // 로그인
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('이미 가입하셨나요?'),
                          TextButton(
                              onPressed: (){
                                //Get.to(() => const Login());
                              },
                              child: const Text('로그인')
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}
