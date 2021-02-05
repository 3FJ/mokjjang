import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

//증상 구조 클라스
class Sym {
  final int id;
  final String symptom;

  Sym({
    this.id,
    this.symptom,
  });
}



class _RegisterPage extends State<RegisterScreen> {
  int selectedIndex;

  //동물
  final concerns = [
    {'label': '닭', 'color': Colors.green},
    {'label': '꿀벌', 'color': Colors.redAccent},
    {'label': '오리', 'color': Colors.indigo},
    {'label': '돼지', 'color': Colors.blue},
    {'label': '소', 'color': Colors.deepOrange},
  ];

  //var _selectedValue;
  final _confirmedList = ['O', 'X'];
  var _selectedconfirmed;

//문자 편집
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  //스크롤
  //ScrollController _scrollViewController;

  //mutiple select 시도중
  static List<Sym> _symptoms = [
    Sym(id: 1, symptom: "사료 섭취 감소"),
    Sym(id: 2, symptom: "구토"),
    Sym(id: 3, symptom: "반복적인 졸음"),
    Sym(id: 4, symptom: "고열"),
    Sym(id: 5, symptom: "수포 발생"),
    Sym(id: 6, symptom: "경련"),
    Sym(id: 7, symptom: "출혈"),
    Sym(id: 8, symptom: "유산"),
    Sym(id: 9, symptom: "색변화"),
    Sym(id: 10, symptom: "번데기 건조"),
    Sym(id: 11, symptom: "부기 발생"),
    Sym(id: 12, symptom: "무기력"),

  ];



  final _items = _symptoms
      .map((animal) => MultiSelectItem<Sym>(animal, animal.symptom))
      .toList();


  List<Sym> _selectedAnimals = [];

  //final _multiSelectKey = GlobalKey<FormFieldState>();


//필드명
  bool tconfirmed;
  //String ttime;
  var tname;
  var tspecies;
  List<String> tsymptom = new List();








//키보드 해제
  void dispose() {
    _tec.dispose();
    _tec2.dispose();
    super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Text(
                  "알림게시판",
                  style: TextStyle(color: Colors.white, fontSize: 27.0),
                ),
                const SizedBox(height: 7.0),
                Text(
                  "현재 목장의 전염병 상황을 알릴 수 있습니다",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16.0),
                ),
              ]),
          centerTitle: true,
          backgroundColor: Color(0xFFffa8a8),
          toolbarHeight: 130,
        ),
        body: Container(
            child: ListView(children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[

                //1번째 줄
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
                            child: Text(
                              '목장 기본 정보',
                              style: TextStyle(fontSize: 15.0, letterSpacing: 1.0),
                            ),
                          ),
                          color: Colors.grey[400]),
                    ),
                  ],
                ),

                //2번째 줄
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                      child: Text(
                        '목장이름 ',
                        style: TextStyle(fontSize: 17.0, letterSpacing: 1.0),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment(0.0, 0.0),
                        height: 45,
                        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.black12)),
                        child: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: TextField(
                              controller: _tec,
                              onChanged: (value) {tname = _tec.text;

                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Input Name',
                                  hintStyle: TextStyle(color: Colors.grey[300])),
                              cursorColor: Colors.blue,
                            )),
                      ),
                    ),
                  ],
                ),


                //4번째 줄
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),

                          child: Text(
                            '가축 정보',
                            style: TextStyle(fontSize: 15.0, letterSpacing: 1.0),
                          ),
                        ),
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),

                //5번째 줄
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                      child: Text(
                        '품종 선택 ',
                        style: TextStyle(fontSize: 17.0, letterSpacing: 1.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 5.0,
                        children: concerns.asMap().entries.map((entry) {
                          int idx = entry.key;
                          return buildChoiceChip(
                            index: idx,
                            label: entry.value['label'],
                            color: entry.value['color'],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                //6번째 줄
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 15.0),
                      child: Text(
                        '증상 선택 ',
                        style: TextStyle(fontSize: 17.0, letterSpacing: 1.0),
                      ),
                    ),

                    /*Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      hint: Text('선택'),
                      value: _selectedValue,
                      items: _valueList.map((value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                    ))*/
                  ],
                ),
                MultiSelectDialogField(

                  items: _items,
                  title: Text("Symptoms"),
                  selectedColor: Colors.pink,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  buttonIcon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.pink,
                  ),
                  buttonText: Text(
                    "Symptoms",
                    style: TextStyle(
                      color: Colors.pink[800],
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {

                    _selectedAnimals = results;


                    for(int i = 0; i < _selectedAnimals.length; i++)
                      tsymptom.add(_selectedAnimals[i].symptom); //= _selectedAnimals;

                  },
                ),

                //7번째 줄
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top:20),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
                          child: Text(
                            '기타 정보',
                            style: TextStyle(fontSize: 15.0, letterSpacing: 1.0),
                          ),
                        ),
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                      child: Text(
                        '확진 유무 ',
                        style: TextStyle(fontSize: 17.0, letterSpacing: 1.0),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          hint: Text('선택'),
                          value: _selectedconfirmed,
                          items: _confirmedList.map((value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              _selectedconfirmed = value;
                              if(value == 'O')
                                tconfirmed = true;
                              else if(value == 'X')
                                tconfirmed = false;
                            });
                          },
                        ))
                  ],
                ),

                //버튼 배치 조정
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    child: Text('공유'),
                    onPressed: () {
                      if(tconfirmed != null && tname != null && tspecies != null && tsymptom != null  /*ttime != null*/) {
                        Firestore.instance.collection("board").add({
                          "confirmed": tconfirmed,
                          "time" : DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
                          "name": tname,
                          "species": tspecies,
                          "symptom": FieldValue.arrayUnion(tsymptom),
                        });

                        Navigator.pop(context);
                      }
                      else
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '필수 정보를 입력하세요.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.teal,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(microseconds: 1000),
                          ),
                        );
                    },
                  ),
                )
              ])
            ])));
  }

  Widget buildChoiceChip({int index, String label, Color color}) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),

      backgroundColor: color,
      padding: const EdgeInsets.all(5),
      selected: selectedIndex == index,
      selectedColor: color.withOpacity(0.5),
      onSelected: (bool selected) {
        setState(() {
          selectedIndex = selected ? index : null;
          tspecies = label;
        });
      },

    );


  }


}
