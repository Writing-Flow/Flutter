import 'package:flutter/material.dart';
import 'package:geulnarae/src/screens/home/my/my_writing_tap.dart';

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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Center(child: Text('마이 페이지')),
              expandedHeight: 230.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('asset/images/my/my_app_bar.png', fit: BoxFit.fitWidth,)
              ),
              bottom: TabBar(
                tabs: myTabs,
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: myTabItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
