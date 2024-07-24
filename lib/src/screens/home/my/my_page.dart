import 'dart:ffi' as ffi;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:geulnarae/src/screens/home/my/my_writing_tap.dart';

import '../../../shared/global.dart';
import '../../../color/app_colors.dart';

final List<Tab> myTabs = <Tab>[
  const Tab(text: '내가 쓴 글'),
];
final List<Widget> myTabItems = [
  MyWritingTap(),
];

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 240.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'asset/images/my/my_app_bar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const ui.Size.fromHeight(50.0), // 탭 바 높이 조정
                    child: Container(
                      color: Colors.white, // 탭 바 배경색 조정
                      child: TabBar(
                        tabs: myTabs,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: AppColors.color_1,
                          ),
                          insets: EdgeInsets.symmetric(horizontal: 0.0),
                        ),
                        labelColor: AppColors.color_1, // 라벨 색상 조정
                        unselectedLabelColor:
                            AppColors.color_5, // 선택되지 않은 라벨 색상 조정
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    children: myTabItems,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 30.0, // 원하는 위치 조정
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Global.nickName,
                    style: const TextStyle(
                      color: AppColors.color_4,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    "지금까지 작성한 글",
                    style: TextStyle(color: AppColors.color_4, fontSize: 13),
                  )
                ],
              ),
            ),
            Positioned(
                top: 140.0, // 원하는 위치 조정
                right: 10,
                child: Container(
                    width: 90, // 컨테이너의 너비
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1.0), // 내부 패딩 설정
                    decoration: BoxDecoration(
                      color: AppColors.color_1,
                      border: Border.all(
                          color: AppColors.color_4, width: 2.0), // 배경색
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: Text(
                        '프로필 수정',
                        style: TextStyle(
                            color: AppColors.color_4,
                            fontSize: 13,
                            fontStyle: FontStyle.normal),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
