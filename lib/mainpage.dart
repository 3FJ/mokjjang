import 'package:flutter/material.dart';
import 'package:mokjjang/information.dart';
import 'package:mokjjang/manual.dart';
import 'package:mokjjang/notify.dart';

void main() => runApp(Mainpage());



class Mainpage extends StatefulWidget {
  Mainpage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Mainpage> {
  int _currentIndex = 0;

  final List<Widget> _children = [Information(), Notify(), Manual()];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFFffa8a8);
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('mokJJANG'),
          backgroundColor: PrimaryColor,
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                title: Text('정보'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.create),
                title: Text('알림'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.warning),
                title: Text('메뉴얼'),
              )
            ]));
  }
}