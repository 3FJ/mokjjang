import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  @override
  NotifyState createState() => NotifyState();
}

class NotifyState extends State<Notify>{
  ScrollController _scrollViewController;
  TabController _controller;

  @override
  Widget build(BuildContext context) {
    final title = '알림게시판 ';

    return MaterialApp(
      title: title,
      home: Scaffold(
        // Scaffold의 appBar는 사용하지 않음. Scaffold의 appBar는 고정 크기와 영역을 가짐
        // CustomScrollView 등록
        body: CustomScrollView(
          // CustomScrollView는 children이 아닌 slivers를 사용하며, slivers에는 스크롤이 가능한 위젯이나 리스트가 등록가능함
          slivers: <Widget>[
            // 앱바 추가
            SliverAppBar(
              title: Text(title),
              // floating 설정. SliverAppBar는 스크롤 다운되면 화면 위로 사라짐.
              // true: 스크롤 업 하면 앱바가 바로 나타남. false: 리스트 최 상단에서 스크롤 업 할 때에만 앱바가 나타남
              floating: true,
              // 최대 높이
              expandedHeight: 100,
              backgroundColor: Colors.red[100],
            ),
            // 리스트 추가
            SliverList(
              // 아이템을 빌드하기 위해서 delegate 항목을 구성함
              // SliverChildBuilderDelegate는 ListView.builder 처럼 리스트의 아이템을 생성해줌
              delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(title: Text('Item #$index')),
                  childCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}