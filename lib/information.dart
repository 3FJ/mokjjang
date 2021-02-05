import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Information extends StatefulWidget {
  @override
  InformationState createState() => InformationState();
}

Future<List> getDisease() async{
  final response = await http.get('https://211.237.50.150:7080/openapi/c223f079b3f3fa8ceca2f27fee137295b233108b4e6e3fb0dd866403ae8bfede/json/Grid_20151204000000000316_1/41000/41840');
  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    final rowData = result['Grid_20151204000000000316_1']['row'] as List;
    List<Row> listModel = rowData.map((rowJson) => Row.fromJson(rowJson)).toList();
    return listModel;
  } else {
    throw Exception('Failed to load Disease Info');
  }
}

class Row {
  int rOWNUM;
  String lKNTSNM;
  String fARMNM;
  String fARMLOCPLC;
  String oCCRRNCDE;
  String lVSTCKSPCNM;
  String dGNSSENGNNM;

  Row(
      {this.rOWNUM,
        this.lKNTSNM,
        this.fARMNM,
        this.fARMLOCPLC,
        this.oCCRRNCDE,
        this.lVSTCKSPCNM,
        this.dGNSSENGNNM,
      }
      );

  Row.fromJson(Map<String, dynamic> json) {
    rOWNUM = json['ROW_NUM'];
    lKNTSNM = json['LKNTS_NM'];
    fARMNM = json['FARM_NM'];
    fARMLOCPLC = json['FARM_LOCPLC'];
    oCCRRNCDE = json['OCCRRNC_DE'];
    lVSTCKSPCNM = json['LVSTCKSPC_NM'];
    dGNSSENGNNM = json['DGNSS_ENGN_NM'];
  }
}

class InformationState extends State<Information> {
  Future<List> currentDisease;

  @override
  void initState() {
    super.initState();
    currentDisease = getDisease();
  }

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
                '현재 전염병 발생 정보',
                style: TextStyle(color: Colors.white, fontSize: 27.0),
              ),
              const SizedBox(height: 7.0),
              Text(
                '현재 각 농장에서 발생한 전염병 정보를 알 수 있습니다',
                style: TextStyle(color: Colors.grey[700], fontSize: 16.0),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: PrimaryColor,
          toolbarHeight: 130,
        ),
        body: Padding(
          // AppBar와 TabBar 사이 공간 만들기(디자인)
          padding: EdgeInsets.only(top: 10),
          child: DefaultTabController(
            length: 5,
            child: Column(
              children: [
                ButtonsTabBar(
                  backgroundColor: Colors.pink, // 선택된 탭은 분홍색으로 채우기
                  unselectedBackgroundColor: Colors.white, // 선택되지 않은 탭은 흰색으로 채우기
                  borderWidth: 1,
                  unselectedBorderColor: Colors.pink, // 선택되지 않은 탭 둘레를 분홍색으로 표현
                  radius: 100, // 탭 둘레를 둥글게 처리
                  tabs: [
                    // 각 동물에 대한 질병 정보를 볼 수 있는 TabBar
                    Tab(icon: ImageIcon(
                      AssetImage("images/cow.png"),
                      size: 50.0,),
                    ),
                    Tab(icon: ImageIcon(
                      AssetImage("images/swarm.png"),
                      size: 50.0,),
                    ),
                    Tab(icon: ImageIcon(
                      AssetImage("images/rubber-duck.png"),
                      size: 50.0,),
                    ),
                    Tab(icon: ImageIcon(
                      AssetImage("images/pig.png"),
                      size: 50.0,),
                    ),
                    Tab(icon: ImageIcon(
                      AssetImage("images/chicken.png"),
                      size: 50.0,),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    // ButtonTap과 TabBarView 사이 공간 만들기(디자인)
                    padding: EdgeInsets.only(top: 10.0),
                    child: TabBarView(
                      children: <Widget>[
                        // 소 관련 질병 발생 정보
                        FutureBuilder<List>(
                          future: currentDisease,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                itemCount: 20, // 최근 발생한 전염병 정보를 20개 보여줍니다
                                itemBuilder: (context, index) {
                                  List<Row> eachAnimal = snapshot.data.where((i) => i.lVSTCKSPCNM.contains("소")).toList(); // 소 관련 정보만을 담는 eachAnimal
                                  eachAnimal.sort((a, b) => b.oCCRRNCDE.compareTo(a.oCCRRNCDE)); // 최근 발생한 전염병 순으로 정렬
                                  Row eachInfo = eachAnimal.elementAt(index); // 발생한 전염병에 대한 자세한 정보
                                  return
                                    ListTile(
                                      leading:ImageIcon(
                                        AssetImage("images/cow.png"),
                                        size: 50.0,),
                                      title: Text(eachInfo.lKNTSNM), // 해당 동물에 발생한 질병명
                                      subtitle: Text(eachInfo.fARMNM + "\n" + eachInfo.fARMLOCPLC), // 농장 위치 정보
                                      trailing: Text(eachInfo.oCCRRNCDE.toString().substring(0,4) + "." +
                                          eachInfo.oCCRRNCDE.toString().substring(4,6) + "." + eachInfo.oCCRRNCDE.toString().substring(6)), // 전염병 발생 날짜
                                    );
                                },
                                separatorBuilder: (context, index) { return Divider(); },
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            // 기본적으로 로딩 Spinner를 보여줍니다.
                            return Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
                                )
                            );
                          },
                        ),
                        // 벌 관련 질병 발생 정보
                        FutureBuilder<List>(
                          future: currentDisease,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                itemCount: 20, // 최근 발생한 전염병 정보를 20개 보여줍니다
                                itemBuilder: (context, index) {
                                  List<Row> eachAnimal = snapshot.data.where((i) => i.lVSTCKSPCNM.contains("벌")).toList(); // 벌 관련 정보만을 담는 eachAnimal
                                  eachAnimal.sort((a, b) => b.oCCRRNCDE.compareTo(a.oCCRRNCDE)); // 최근 발생한 전염병 순으로 정렬
                                  Row eachInfo = eachAnimal.elementAt(index); // 발생한 전염병에 대한 자세한 정보
                                  return
                                    ListTile(
                                      leading:ImageIcon(
                                        AssetImage("images/swarm.png"),
                                        size: 50.0,),
                                      title: Text(eachInfo.lKNTSNM), // 해당 동물에 발생한 질병명
                                      subtitle: Text(eachInfo.fARMNM + "\n" + eachInfo.fARMLOCPLC), // 농장 위치 정보
                                      trailing: Text(eachInfo.oCCRRNCDE.toString().substring(0,4) + "." +
                                          eachInfo.oCCRRNCDE.toString().substring(4,6) + "." + eachInfo.oCCRRNCDE.toString().substring(6)), // 전염병 발생 날짜
                                    );
                                },
                                separatorBuilder: (context, index) { return Divider(); },
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            // 기본적으로 로딩 Spinner를 보여줍니다.
                            return Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
                                )
                            );
                          },
                        ),
                        // 오리 관련 질병 발생 정보
                        FutureBuilder<List>(
                          future: currentDisease,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                itemCount: 20, // 최근 발생한 전염병 정보를 20개 보여줍니다
                                itemBuilder: (context, index) {
                                  List<Row> eachAnimal = snapshot.data.where((i) => i.lVSTCKSPCNM.contains("오리")).toList(); // 오리 관련 정보만을 담는 eachAnimal
                                  eachAnimal.sort((a, b) => b.oCCRRNCDE.compareTo(a.oCCRRNCDE)); // 최근 발생한 전염병 순으로 정렬
                                  Row eachInfo = eachAnimal.elementAt(index); // 발생한 전염병에 대한 자세한 정보
                                  return
                                    ListTile(
                                      leading:ImageIcon(
                                        AssetImage("images/rubber-duck.png"),
                                        size: 50.0,),
                                      title: Text(eachInfo.lKNTSNM), // 해당 동물에 발생한 질병명
                                      subtitle: Text(eachInfo.fARMNM + "\n" + eachInfo.fARMLOCPLC), // 농장 위치 정보
                                      trailing: Text(eachInfo.oCCRRNCDE.toString().substring(0,4) + "." +
                                          eachInfo.oCCRRNCDE.toString().substring(4,6) + "." + eachInfo.oCCRRNCDE.toString().substring(6)), // 전염병 발생 날짜
                                    );
                                },
                                separatorBuilder: (context, index) { return Divider(); },
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            // 기본적으로 로딩 Spinner를 보여줍니다.
                            return Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
                                )
                            );
                          },
                        ),
                        // 돼지 관련 질병 발생 정보
                        FutureBuilder<List>(
                          future: currentDisease,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                itemCount: 20, // 최근 발생한 전염병 정보를 20개 보여줍니다
                                itemBuilder: (context, index) {
                                  List<Row> eachAnimal = snapshot.data.where((i) => i.lVSTCKSPCNM.contains("돼지")).toList(); // 돼지 관련 정보만을 담는 eachAnimal
                                  eachAnimal.sort((a, b) => b.oCCRRNCDE.compareTo(a.oCCRRNCDE)); // 최근 발생한 전염병 순으로 정렬
                                  Row eachInfo = eachAnimal.elementAt(index); // 발생한 전염병에 대한 자세한 정보
                                  return
                                    ListTile(
                                      leading:ImageIcon(
                                        AssetImage("images/pig.png"),
                                        size: 50.0,),
                                      title: Text(eachInfo.lKNTSNM), // 해당 동물에 발생한 질병명
                                      subtitle: Text(eachInfo.fARMNM + "\n" + eachInfo.fARMLOCPLC), // 농장 위치 정보
                                      trailing: Text(eachInfo.oCCRRNCDE.toString().substring(0,4) + "." +
                                          eachInfo.oCCRRNCDE.toString().substring(4,6) + "." + eachInfo.oCCRRNCDE.toString().substring(6)), // 전염병 발생 날짜
                                    );
                                },
                                separatorBuilder: (context, index) { return Divider(); },
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            // 기본적으로 로딩 Spinner를 보여줍니다.
                            return Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
                                )
                            );
                          },
                        ),
                        // 닭 관련 질병 발생 정보
                        FutureBuilder<List>(
                          future: currentDisease,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                itemCount: 20, // 최근 발생한 전염병 정보를 20개 보여줍니다
                                itemBuilder: (context, index) {
                                  List<Row> eachAnimal = snapshot.data.where((i) => i.lVSTCKSPCNM.contains("닭")).toList(); // 닭 관련 정보만을 담는 eachAnimal
                                  eachAnimal.sort((a, b) => b.oCCRRNCDE.compareTo(a.oCCRRNCDE)); // 최근 발생한 전염병 순으로 정렬
                                  Row eachInfo = eachAnimal.elementAt(index); // 발생한 전염병에 대한 자세한 정보
                                  return
                                    ListTile(
                                      leading:ImageIcon(
                                        AssetImage("images/chicken.png"),
                                        size: 50.0,),
                                      title: Text(eachInfo.lKNTSNM), // 해당 동물에 발생한 질병명
                                      subtitle: Text(eachInfo.fARMNM + "\n" + eachInfo.fARMLOCPLC), // 농장 위치 정보
                                      trailing: Text(eachInfo.oCCRRNCDE.toString().substring(0,4) + "." +
                                          eachInfo.oCCRRNCDE.toString().substring(4,6) + "." + eachInfo.oCCRRNCDE.toString().substring(6)), // 전염병 발생 날짜
                                    );
                                },
                                separatorBuilder: (context, index) { return Divider(); },
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            // 기본적으로 로딩 Spinner를 보여줍니다.
                            return Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
                                )
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}