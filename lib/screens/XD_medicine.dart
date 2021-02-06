import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class XD_medicine extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<XD_medicine> {
  ScrollController scrollController;
  List<Medicine> listM = new List<Medicine>();
  int length = 10;
  SharedPreferences sharedPreferencesM;

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd H:m').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
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
                    SizedBox(
                      width: 30.0,
                    ),
                    Text("약 관리",
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
                height: 32,
              ),
              Container(
                child: Flexible(
                    child: listM.isEmpty ? emptyList() : buildListViewM()),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff3f4243),
          elevation: 0,
          onPressed: () => goToNewItemView(),
          child: Icon(
            Icons.add,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Widget emptyList() {
    return SafeArea(
      child: Center(
        child: Text("등록된 약이 없습니다.",
            style: const TextStyle(
                color: const Color(0xff02171a),
                fontWeight: FontWeight.w400,
                fontFamily: "SpoqaHanSansNeo",
                fontStyle: FontStyle.normal,
                fontSize: 20.0),
            textAlign: TextAlign.left),
      ),
    );
  }

  @override
  void initState() {
    loadSharedPreferencesAndDataM();
    super.initState();
  }

  void loadSharedPreferencesAndDataM() async {
    sharedPreferencesM = await SharedPreferences.getInstance();
    loadData();
  }

  Widget buildListViewM() {
    return ListView.builder(
      primary: false,
      padding: EdgeInsets.all(0),
      itemCount: listM.length,
      itemBuilder: (BuildContext contextM, int indexM) {
        return buildListTileM(listM[indexM], indexM);
      },
    );
  }

  Widget recentlyListView() {
    return ListView.builder(
      primary: false,
      padding: EdgeInsets.all(0),
      itemCount: 1,
      itemBuilder: (BuildContext contextM, int indexM) {
        return buildListTileM(listM[0], 0);
      },
    );
  }

  Widget buildListTileM(Medicine itemM, int indexM) {
    return Column(
      children: [
        Card(
          child: ListTile(
            tileColor: Color(0xffd3dfe1),
            title: Column(
              children: <Widget>[
                Text(
                  itemM.date != null ? itemM.date : '',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  itemM.title != null ? itemM.title : '',
                  key: Key('item-$indexM'),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            trailing: FlatButton(
              child: Text(
                "삭제",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                setState(
                  () {
                    removeItem(itemM);
                    loadSharedPreferencesAndDataM();
                  },
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 13,
        ),
      ],
    );
  }

  void goToNewItemView() {
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewMedicineView();
    })).then((title) {
      if (title != null) {
        addItem(Medicine(title: title, date: formattedDate));
      }
    });
  }

  void addItem(Medicine item) {
    // Insert an item into the top of our list, on index zero
    listM.insert(0, item);
    saveData();
    loadData();
  }

  void removeItem(Medicine item) {
    listM.remove(item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferencesM.getStringList('listM');
    if (listString != null) {
      listM = listString
          .map((item) => Medicine.fromMap(json.decode(item)))
          .toList();
      setState(() {});
    }
  }

  void saveData() {
    List<String> stringList =
        listM.map((item) => json.encode(item.toMap())).toList();
    sharedPreferencesM.setStringList('listM', stringList);
  }
}

class Medicine {
  String title;
  String date;

  Medicine({
    this.title,
    this.date,
  });

  Medicine.fromMap(Map map)
      : this.title = map['title'],
        this.date = map['date'];

  Map toMap() {
    return {
      'title': this.title,
      'date': this.date,
    };
  }
}

class NewMedicineView extends StatefulWidget {
  final Medicine item;

  NewMedicineView({this.item});

  @override
  _NewMedicineViewState createState() => _NewMedicineViewState();
}

class _NewMedicineViewState extends State<NewMedicineView> {
  TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = new TextEditingController(
        text: widget.item != null ? widget.item.title : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
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
            Text("복용하는 약 기록",
                style: const TextStyle(
                    color: const Color(0xff02171a),
                    fontWeight: FontWeight.w400,
                    fontFamily: "SpoqaHanSansNeo",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              cursorColor: Colors.black26,
              style: TextStyle(fontSize: 30),
              controller: titleController,
              autofocus: true,
              onSubmitted: (value) => submit(),
            ),
            SizedBox(
              height: 50.0,
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
