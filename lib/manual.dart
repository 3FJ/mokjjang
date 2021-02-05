import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mokjjang/register.dart';
import 'package:url_launcher/url_launcher.dart';

class Manual extends StatefulWidget {
  @override
  ManualState createState() => ManualState();
}

class ManualState extends State<Manual> {
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFFffa8a8);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              Text(
                '가축 전염병 발생시 대응방법',
                style: TextStyle(fontFamily: "cafe", color: Colors.white, fontSize: 27.0),
              ),
              const SizedBox(height: 7.0),
              Text(
                '각 질병을 누르면 대응방법과 예방책을 볼 수 있습니다',
                style: TextStyle(color: Colors.grey[700], fontSize: 16.0),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: PrimaryColor,
          toolbarHeight: 130,
        ),
        body: ListView(
          children: <Widget>[
            RaisedButton.icon(
                onPressed: () {
                  //url_launcher 사용. 실제로 버튼 클릭시 전화 화면 나옴.
                  launch(('tel://1588-9060'));
                },
                icon: Icon(Icons.call,  color:Color(0xFF87003A)),
                label: Text('가축방역기관에 전화하여 신고하기', style: TextStyle(fontSize: 15))),
            ListTile(
              tileColor: Colors.white,
              leading: ImageIcon(
                AssetImage("images/cow.png"),
                color: Colors.red[300],
                size: 50.0,
              ),
              title: Text(' 브루셀라병', style: TextStyle(color: Colors.grey[800], fontSize: 20.0, fontWeight: FontWeight.bold),),
              minVerticalPadding: 30,
              //버튼 클릭시 alertdialog가 나와 각 병에 대한 예방책/대응방법을 알려줌
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text('브루셀라병', style: TextStyle(fontWeight: FontWeight.bold)),
                      content: Container(
                        height: 400.0,
                        width: 350.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 농장 내 청결한 위상 상태 유지와 \n철저한 차단방역으로 예방 가능'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 소 구입 후 일정기간(30~60일) \n 동거소와 격리, \n 관할가축방역기관에 \n 브루셀라병 검사 의뢰 후 \n 이상이 없는 경우 합사'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text('정기검사 받은 종모우 사용, \n 인공수정(기구 소독 철저) 실시'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text('유·사산 소는 즉시 격리 \n 분비물은 소독 후 소각 또는 매몰'),
                                ),
                              ],
                            ),
                            FlatButton(
                              child: Text('ⓧ', style: TextStyle(color: Colors.red[300], fontSize: 35.0),),
                              //버튼을 누를 시 다이얼로그 사라짐.
                              onPressed: () { Navigator.of(context).pop(); },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[900],
            ),
            ListTile(
              tileColor: Colors.white,
              leading: ImageIcon(
                AssetImage("images/cow.png"),
                color: Colors.red[300],
                size: 50.0,
              ),
              title: Text(' 결핵병', style: TextStyle(color: Colors.grey[800], fontSize: 20.0, fontWeight: FontWeight.bold),),
              minVerticalPadding: 30,
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text('결핵병', style: TextStyle(fontWeight: FontWeight.bold)),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 농장간 차단 방역 강화, \n소를 구입할 때 소결핵 청정지역, \n 청정농장으로부터 결핵 음성소를 \n 확인한 후 구입'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 결핵 증상을 가진 소 뿐만아니라 \n 잠복 감염된 소도 제거할 필요 O'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 결핵검진방법을 통하여 \n 결핵 감염소를 검색하여 제거'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 결핵 감염 확인시 \n 양성소 제거, \n 양성소의 분비물 및 배설물 \n 등에 의해 오염된 구역과 \n 기구를 세척·살균'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 반드시 방역기관에 신고'),
                                ),
                              ],
                            ),

                            FlatButton(
                              child: Text('ⓧ', style: TextStyle(color: Colors.red[300], fontSize: 35.0),),
                              onPressed: () { Navigator.of(context).pop(); },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[900],
            ),
            ListTile(
              tileColor: Colors.white,
              leading: ImageIcon(
                AssetImage("images/swarm.png"),
                color: Colors.red[300],
                size: 50.0,
              ),
              title: Text(' 낭충봉아부패병', style: TextStyle(color: Colors.grey[800], fontSize: 20.0, fontWeight: FontWeight.bold),),
              minVerticalPadding: 30,
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text('낭충봉아부패병', style: TextStyle(fontWeight: FontWeight.bold)),
                      content: Container(
                        height: 400.0,
                        width: 350.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 세균의 2차 감염 방지를 위해 \n 사료용 항생제 테라마이신\n(옥시테트라싸이클린) 등을 \n 소문에 뿌릴 것'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 감염봉군은 격리하여 소각처리'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 건강봉군들 주변과 벌통 바깥 및 \n 봉기구들에 삼종염계열의 \n 소독약 뿌릴 것'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 사료용 비타민, 미네랄 합제 \n 등을 설탕물이나 꿀물에 타서 \n 꿀벌에게 직접 분무하여 \n 영양을 충분히 급여'),
                                ),
                              ],
                            ),

                            FlatButton(
                              child: Text('ⓧ', style: TextStyle(color: Colors.red[300], fontSize: 35.0),),
                              onPressed: () { Navigator.of(context).pop(); },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[900],
            ),
            ListTile(
              tileColor: Colors.white,
              leading: new Wrap(
                spacing: 5.0,
                children: <Widget>[ImageIcon(
                  AssetImage("images/rubber-duck.png"),
                  color: Colors.red[300],
                  size: 50.0,
                ),
                  ImageIcon(
                    AssetImage("images/chicken.png"),
                    color: Colors.red[300],
                    size: 50.0,
                  ),
                ],
              ),
              title: Text(' 고병원성조류인플루엔자', style: TextStyle(color: Colors.grey[800], fontSize: 20.0, fontWeight: FontWeight.bold),),
              minVerticalPadding: 30,
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text('고병원성조류인플루엔자', style: TextStyle(fontWeight: FontWeight.bold)),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 가장 중요한 것은 차단방역과 \n 발생초기에 적극적인 살처분'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 외부인, 외부차량 출입통제, \n 양계장에 비치된 장비, 기구 \n 특히 난좌 등을 항상 세척&소독'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 일반적인 소독약제로도 효과 O'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 농장 출입차단 등 차단방역이 \n 가장 중요'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 발생 시사육하는 닭 전두수를 \n 살처분 소각·매몰해야함 '),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 사육농장 내외를 \n 계속적으로 소독처리'),
                                ),
                              ],
                            ),

                            FlatButton(
                              child: Text('ⓧ', style: TextStyle(color: Colors.red[300], fontSize: 35.0),),
                              onPressed: () { Navigator.of(context).pop(); },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[900],
            ),
            ListTile(
              tileColor: Colors.white,
              leading: ImageIcon(
                AssetImage("images/pig.png"),
                color: Colors.red[300],
                size: 50.0,
              ),
              title: Text(' 돼지생식기호흡기증후군', style: TextStyle(color: Colors.grey[800], fontSize: 20.0, fontWeight: FontWeight.bold),),
              minVerticalPadding: 33,
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text('돼지생식기호흡기증후군', style: TextStyle(fontWeight: FontWeight.bold)),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 이 질병에 대한 치료법은 없고 \n 다른 세균성 질병의 혼합감염을 \n 막기 위한 항생제 치료가 필요'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 돈군간 감염고리 끊을 수 있는 \n 조기이유기법, 격리사육기법 등 \n 돈군 청정관리기법의 적용이 \n 가장 효과적인 방제방법'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 유·사산형 \n => 유산 태아와 모돈의 혈청을 \n 대상으로 검사를 실시'),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 20.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(Icons.toys),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: new Text(' 호흡기형 \n => 자돈의 일령별로 혈청을 채취, \n 바이러스 및 항체 검사를 실시하여 \n 감염상황을 파악한 후에 \n 농장별로 적절한 방제조치'),
                                ),
                              ],
                            ),

                            FlatButton(
                              child: Text('ⓧ', style: TextStyle(color: Colors.red[300], fontSize: 35.0),),
                              onPressed: () { Navigator.of(context).pop(); },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}