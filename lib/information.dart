import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';


class Information extends StatefulWidget {
  @override
  InformationState createState() => InformationState();
}

class InformationState extends State<Information> {
  @override

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
                style: TextStyle(fontFamily: "cafe", color: Colors.white, fontSize: 27.0),
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
                        ListView(
                          children: [
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('브루셀라병'),
                              subtitle: Text('최영환 / 경상남도 밀양시 삼량진읍 용성리'),
                              trailing: Text('2021/01/29'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('결핵병'),
                              subtitle: Text('철환농장 / \n경상남도 창원시 의창구 복면 신촌리'),
                              trailing: Text('2021/01/27'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('브루셀라병'),
                              subtitle: Text('우종대 / 울산광역시 울주군 범서읍 척과리'),
                              trailing: Text('2021/01/23'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('브루셀라병'),
                              subtitle: Text('김동국 / 경상남도 밀양시 삼량진읍 임천리'),
                              trailing: Text('2021/01/22'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('브루셀라병'),
                              subtitle: Text('김상철 / 경상남도 밀양시 삼량진읍 용성리'),
                              trailing: Text('2021/01/22'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('결핵병'),
                              subtitle: Text('이봉형 / 울산광역시 울주군 두동면 월평리'),
                              trailing: Text('2021/01/21'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('결핵병'),
                              subtitle: Text('류종영 / 경상남도 밀양시 삼량진읍 용성리'),
                              trailing: Text('2021/01/21'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('결핵병'),
                              subtitle: Text('정은농장 / 경상남도 진주시 이반성면 장안리'),
                              trailing: Text('2021/01/21'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('결핵병'),
                              subtitle: Text('이경용 / 경상남도 함안군 군북면 하림리'),
                              trailing: Text('2021/01/20'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/cow.png"),
                                size: 50.0,
                              ),
                              title: Text('결핵병'),
                              subtitle: Text('자혜목장 / 경상남도 사천시 서포면 자혜리'),
                              trailing: Text('2021/01/14'),
                            ),
                          ],
                        ),
                        // 벌 관련 질병 발생 정보
                        ListView(
                          children: [
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('정남혁 / 전라남도 화순군 한천면 정리'),
                              trailing: Text('2020/12/28'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('서주석 / 충청북도 보은군 회인면 애곡리'),
                              trailing: Text('2020/12/01'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('양수현 / \n제주특별자치도 서귀포시 표선면 표선리'),
                              trailing: Text('2020/12/01'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('강조훈 / 경상남도 사천시 사천읍 두량리'),
                              trailing: Text('2020/11/30'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('드보라 양봉 2 / \n강원도 양구군 방산면 고방산리'),
                              trailing: Text('2020/11/30'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('이원근 / 경상북도 의성군 옥산면 감계리'),
                              trailing: Text('2020/11/26'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('안길석 / 전라남도 고흥군 영남면 우천리'),
                              trailing: Text('2020/11/19'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('홍병세 / 경상남도 산청군 금서면 수철리'),
                              trailing: Text('2020/11/13'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('홍지원 / 전라북도 임실군 신덕면 월성리'),
                              trailing: Text('2020/11/10'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/swarm.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('전주봉 / 강원도 평창군 미탄면 창리'),
                              trailing: Text('2020/11/10'),
                            ),
                          ],
                        ),
                        // 양 관련 질병 발생 정보
                        ListView(
                          children: [
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/rubber-duck.png"),
                                size: 50.0,
                              ),
                              title: Text('낭충봉아부패병'),
                              subtitle: Text('전주봉 / 강원도 평창군 미탄면 창리'),
                              trailing: Text('2020/11/10'),
                            ),
                          ],
                        ),
                        // 돼지 관련 질병 발생 정보
                        ListView(
                          children: [
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('승하농장 / \n제주특별자치도 서귀포시 안덕면 상창리'),
                              trailing: Text('2020/12/29'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('태흥종축 영농조합법인 해남지점 / \n전라남도 해남군 황상면 관춘리'),
                              trailing: Text('2020/11/27'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('제주도니유전센터 / \n제주특별자치도 제주시 구좌읍 세화리'),
                              trailing: Text('2020/11/25'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('참나무농장 / 제주특별자치도 제주시 해안동'),
                              trailing: Text('2020/11/24'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('제주특별자치도 제주시 애월읍 광령2리'),
                              trailing: Text('2020/11/18'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('우리농장 / \n제주특별자치도 제주시 한림읍 상대리'),
                              trailing: Text('2020/10/30'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('제주양돈 / \n제주특별자치도 제주시 애월읍 고성리'),
                              trailing: Text('2020/10/14'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('우경농장 / \n제주특별자치도 제주시 한림읍 금능리'),
                              trailing: Text('2020/10/08'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('제주도니유전센터 / \n제주특별자치도 제주시 구좌읍 세화리'),
                              trailing: Text('2020/09/28'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/pig.png"),
                                size: 50.0,
                              ),
                              title: Text('돼지생식기호흡기증후군'),
                              subtitle: Text('섬진농장 / 전라북도 임실군 덕치면 물우리'),
                              trailing: Text('2020/08/14'),
                            ),
                          ],
                        ),
                        // 닭 관련 질병 발생 정보
                        ListView(
                          children: [
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('영포양계영농협동조합법인 / \n경상북도 포항시 북구 청하면 신흥리'),
                              trailing: Text('2021/01/31'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('정기농장 / 경기도 이천시 율면 신추리'),
                              trailing: Text('2021/01/30'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('청산농장 / 경기도 안성시 공도읍 마정리'),
                              trailing: Text('2021/01/29'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('호현농장 / 경기도 이천시 장호원읍 와현리'),
                              trailing: Text('2021/01/28'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('유화농장 / 경기도 안성시 보개면 동신리'),
                              trailing: Text('2021/01/28'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('영화농장 / 경기도 안성시 일죽면 장암리'),
                              trailing: Text('2021/01/27'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('신한농장 / 경기도 파주시 적성면 어유지리'),
                              trailing: Text('2021/01/27'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('계림농장 / 경기도 포천시 신북면 삼성당리'),
                              trailing: Text('2021/01/27'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('서울종계장 / \n경기도 이천시 장호원읍 와현리'),
                              trailing: Text('2021/01/27'),
                            ),
                            ListTile(
                              leading: ImageIcon(
                                AssetImage("images/chicken.png"),
                                size: 50.0,
                              ),
                              title: Text('고병원성조류인플루엔자'),
                              subtitle: Text('경기도 화성시 양감면 사창리'),
                              trailing: Text('2021/01/24'),
                            ),
                          ],
                        )
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