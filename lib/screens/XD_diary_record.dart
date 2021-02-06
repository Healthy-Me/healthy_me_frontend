import 'package:flutter/material.dart';
import 'package:healthy_me/screens/XD_diary.dart';

import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class XD_diary_record extends StatefulWidget {
  @override
  SecondRoute createState() => SecondRoute();
}

//일지기록화면
class SecondRoute extends State<XD_diary_record> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)))),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController;
  List<Healthy> list = new List<Healthy>();
  int length = 15;
  SharedPreferences sharedPreferences;

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: -6.0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.centerLeft,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44.0)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => XD_diary_record(),
                ),
              );
            },
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: 1.5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.navigate_before,
                  ),
                  SizedBox(
                    width: 355.0,
                  ),
                  Icon(
                    Icons.update,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image(
                width: 40.9,
                height: 55.3,
                image: AssetImage(
                  'image/home_logo.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: 354,
              child: Row(
                children: [
                  Text("건강일지 기록",
                      style: const TextStyle(
                          color: const Color(0xff02171a),
                          fontWeight: FontWeight.bold,
                          fontFamily: "SpoqaHanSansNeo",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                  ),
                  Text(formattedDate,
                      style: const TextStyle(
                          color: Color(0xff406f74),
                          fontWeight: FontWeight.bold,
                          fontFamily: "SpoqaHanSansNeo",
                          fontStyle: FontStyle.normal,
                          fontSize: 28.0),
                      textAlign: TextAlign.left),
                  SizedBox(
                    width: 20.0,
                  ),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minWidth: 60.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Color(0xffd3dfe1),
                      elevation: 0,
                      onPressed: () => goToNewItemView(),
                      child: Text("+ 쓰기",
                          style: const TextStyle(
                              color: Color(0xff54767a),
                              fontWeight: FontWeight.bold,
                              fontFamily: "SpoqaHanSansNeo",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Flexible(child: buildListView()),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    loadSharedPreferencesAndData();
    super.initState();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return buildListTile(list[index], index);
      },
    );
  }

  Widget buildListTile(Healthy item, int index) {
    return Card(
        color: Color(0xffbbc9cb),
        child: ListTile(
          title: Column(
            children: <Widget>[
              Text(
                item.title,
                key: Key('item-$index'),
                style: TextStyle(
                    color: const Color(0xff02171a),
                    fontFamily: "SpoqaHanSansNeo",
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          trailing: FlatButton(
            child: Text(
              "삭제",
              style: TextStyle(
                  color: const Color(0xff02171a),
                  fontFamily: "SpoqaHanSansNeo",
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              setState(() {
                removeItem(item);
                loadSharedPreferencesAndData();
              });
            },
          ),
        ));
  }

  void goToNewItemView() {
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewHealthyView();
    })).then((title) {
      if (title != null) {
        addItem(Healthy(title: title));
      }
    });
  }

  void addItem(Healthy item) {
    // Insert an item into the top of our list, on index zero
    list.insert(0, item);
    saveData();
  }

  void removeItem(Healthy item) {
    list.remove(item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    if (listString != null) {
      list =
          listString.map((item) => Healthy.fromMap(json.decode(item))).toList();
      setState(() {});
    }
  }

  void saveData() {
    List<String> stringList =
        list.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list', stringList);
  }
}

class Healthy {
  String title;

  Healthy({
    this.title,
  });

  Healthy.fromMap(Map map) : this.title = map['title'];

  Map toMap() {
    return {
      'title': this.title,
    };
  }
}

class NewHealthyView extends StatefulWidget {
  final Healthy item;

  NewHealthyView({this.item});

  @override
  _NewHealthyViewState createState() => _NewHealthyViewState();
}

class _NewHealthyViewState extends State<NewHealthyView> {
  TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = new TextEditingController(
        text: widget.item != null ? widget.item.title : null);
  }

//일지 쓰기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: -6.0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.centerLeft,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44.0)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => XD_diary(),
                ),
              );
            },
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: 1.5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.navigate_before,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image(
                width: 40.9,
                height: 55.3,
                image: AssetImage(
                  'image/home_logo.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text("일지 작성",
                style: const TextStyle(
                    color: const Color(0xff02171a),
                    fontWeight: FontWeight.bold,
                    fontFamily: "SpoqaHanSansNeo",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              cursorColor: Colors.black,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              controller: titleController,
              autofocus: true,
              onSubmitted: (value) => submit(),
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff54767a), width: 3.0),
                ),
                hintText: '건강한 나를 만들어요',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minWidth: 126.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Color(0xffbbc9cb),
                    elevation: 0,
                    onPressed: () {
                      setState(() {
                        titleController.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: Text("취소",
                        style: const TextStyle(
                          color: Color(0xff02171a),
                          fontWeight: FontWeight.bold,
                          fontFamily: "SpoqaHanSansNeo",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.left),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minWidth: 126.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Color(0xffbbc9cb),
                    elevation: 0,
                    onPressed: () => submit(),
                    child: Text("저장",
                        style: const TextStyle(
                            color: Color(0xff02171a),
                            fontWeight: FontWeight.bold,
                            fontFamily: "SpoqaHanSansNeo",
                            fontStyle: FontStyle.normal,
                            fontSize: 15.0),
                        textAlign: TextAlign.left),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void submit() {
    Navigator.of(context).pop(titleController.text);
  }
}
