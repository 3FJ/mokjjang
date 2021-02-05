import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mokjjang/register.dart';

class Notify extends StatefulWidget {
  @override
  NotifyState createState() => NotifyState();
}

class NotifyState extends State<Notify>{


  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFFFFA8A8);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              Text(
                "알림게시판",
                style: TextStyle(fontFamily: "cafe", color: Colors.white, fontSize: 27.0),
              ),
              const SizedBox(height: 7.0),
              Text(
                "자신의 목장의 전염병 상황을 알릴 수 있습니다",
                style: TextStyle(color: Colors.grey[700], fontSize: 16.0),
              ),
            ]
        ),
          centerTitle: true,
          backgroundColor: PrimaryColor,
          toolbarHeight: 130,),
        body: Column(
            children: <Widget>[
              Container(
                height: 500,
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("board").orderBy("time", descending: true).snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading...");
                      default:
                        return ListView(
                          children:  snapshot.data.documents
                              .map((DocumentSnapshot document) {

                            List<String> symptom = List.from(document['symptom']);

                            return new ListTile(
                              title: new Text(document['name']),
                              subtitle: new Text(document['time']),
                              trailing: new Wrap(
                                spacing: 5.0, // gap between adjacent chips
                                runSpacing: 1.0, // gap between lines
                                children: <Widget>[
                                  Chip(
                                    label: new Text(document['species'], style: TextStyle(color: Colors.white)),
                                    backgroundColor: Colors.pinkAccent,
                                  ),
                                  for(var i = 0; i < symptom.length; i++)
                                    Chip(
                                      label: new Text(symptom[i], style: TextStyle(color: Colors.white)),
                                      backgroundColor: Colors.blue[400],
                                    ),
                                  (document['confirmed'] == true)
                                      ?
                                  Chip(
                                    label: new Text("감염", style: TextStyle(color: Colors.white)),
                                    backgroundColor: Colors.red,
                                  ):
                                  Chip(
                                    label: new Text("미감염", style: TextStyle(color: Colors.grey[900])),
                                    backgroundColor: Colors.yellow,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),

                        );
                    }
                  },
                ),

              )
            ]
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        //버튼의 구성 동작 추가(누르면 register.dart에 있는 screen으로 화면 전환)
        floatingActionButton: new FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => RegisterScreen()));
            },
            child: new Icon(Icons.add),
            //버튼 색상 설정
            backgroundColor: Colors.grey[400]),
      ),
    );
  }
}