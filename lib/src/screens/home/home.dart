
import 'package:flutter/material.dart';
import 'package:geulnarae/src/color/app_colors.dart';
import 'package:geulnarae/src/screens/home/dictionary/dictionary_search.dart';
import 'package:geulnarae/src/screens/home/my/my_page.dart';
import 'package:geulnarae/src/screens/home/quiz/quiz_intro.dart';

import 'writing/writing_intro.dart';

final List<BottomNavigationBarItem> myTabs = [
  const BottomNavigationBarItem(icon: ImageIcon(AssetImage('asset/images/navigation_bar/ink_pen.png')), label: '작문'),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: '사전'),
  const BottomNavigationBarItem(icon: Icon(Icons.extension), label: '퀴즈'),
  const BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: '라운지'),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
];

final List<Widget> myTabItems = [
  WritingIntro(),
  DictionarySearch(),
  QuizIntro(),
  Center(child: Text('라운지')),
  MyPage()
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.color_1,
        unselectedItemColor: AppColors.color_5,
        showUnselectedLabels: true,
        items: myTabs,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: myTabItems,
      ),
    );
  }
}
