import 'package:flutter/material.dart';

import 'mainpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOKJJANG',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Mainpage(title : 'mokJJANG'),
    );
  }
}