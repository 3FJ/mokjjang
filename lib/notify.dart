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
    return Container(
      child: Text('Notify'),
    );
  }
}