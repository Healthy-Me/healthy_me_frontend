import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';  
import 'package:table_calendar/table_calendar.dart';  
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
  
void main() => runApp(OneMyApp());    

class OneMyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      theme: ThemeData(  
        primarySwatch: Colors.lightGreen,  
      ),  
      home: HomeCalendarPage(),  
    );  
  }  
}  
  
class HomeCalendarPage extends StatefulWidget {  
  @override  
  _HomeCalendarPageState createState() => _HomeCalendarPageState();  
}  
  
class _HomeCalendarPageState extends State<HomeCalendarPage> {  
  CalendarController _controller;  
  
  @override  
  void initState() {  
    super.initState();  
    _controller = CalendarController();  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('Healthy Calendar'),  
      ),  
      body: SingleChildScrollView(  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: <Widget>[  
            TableCalendar(  
              initialCalendarFormat: CalendarFormat.month,  
              calendarStyle: CalendarStyle(  
                  todayColor: Colors.blue,  
                  selectedColor: Theme.of(context).primaryColor,  
                  todayStyle: TextStyle(  
                      fontWeight: FontWeight.bold,  
                      fontSize: 25.0,  
                      color: Colors.white)  
              ),  
              headerStyle: HeaderStyle(  
                centerHeaderTitle: true,  
                formatButtonDecoration: BoxDecoration(  
                  color: Colors.green,  
                  borderRadius: BorderRadius.circular(22.0),  
                ),  
                formatButtonTextStyle: TextStyle(color: Colors.white),  
                formatButtonShowsNext: false,  
              ),  
              startingDayOfWeek: StartingDayOfWeek.sunday,    
              builders: CalendarBuilders(  
                selectedDayBuilder: (context, date, events) => Container(  
                    margin: const EdgeInsets.all(3.0),  
                    alignment: Alignment.center,  
                    decoration: BoxDecoration(  
                        color: Theme.of(context).primaryColor,  
                        borderRadius: BorderRadius.circular(30.0)),  
                    child: FlatButton(
                      child: Text(  
                      date.day.toString(),  
                      style: TextStyle(color: Colors.white),  
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondRoute()),
                          );}
                    )),  
                todayDayBuilder: (context, date, events) => Container(  
                    margin: const EdgeInsets.all(3.0),  
                    alignment: Alignment.center,  
                    decoration: BoxDecoration(  
                        color: Colors.orange,  
                        borderRadius: BorderRadius.circular(30.0),
                        ), 
                    child: Text(  
                      date.day.toString(),  
                      style: TextStyle(color: Colors.white),  
                    ),),  
              ),  
              calendarController: _controller,  
            )  
          ],  
        ),  
      ),  
    );  
  }  
} 

//일지화면
class SecondRoute extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black) 
            )
        )
      ),
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
        backgroundColor: Colors.lightGreen,
        leading:
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OneMyApp()),
                );
            },
          ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(formattedDate,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  
                ],
              ),
            ),
            Container(
              alignment: Alignment.center, 
              child: RaisedButton(
                  color: Colors.green,
                  elevation: 0,
                  onPressed: () =>goToNewItemView(),
                  child: Text('기록 & 계획 추가',
                  style: TextStyle(fontSize:30, color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),),
            ),
            SizedBox(height: 30),
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
      itemBuilder: (BuildContext context,int index){
        return buildListTile(list[index], index);
      },
    );
  }

  Widget buildListTile(Healthy item, int index){
    return Card(
        color: Color(0xFFDCEDC8),
        child: ListTile(
          title: Column(
            children: <Widget>[
              Text(
                item.title,
                key: Key('item-$index'),
                style: TextStyle(
                    fontSize: 20,
                ),
              ),
            ],
          ),
          trailing:FlatButton(
              child:Text("완료",style: TextStyle(fontSize: 20, color: Color(0xFF1B5E20),fontWeight: FontWeight.bold),),
              onPressed: () {
                setState(() { 
                  removeItem(item);
                  loadSharedPreferencesAndData();
                });
              },
          ),
        ));
  }

  void goToNewItemView(){
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return NewHealthyView();
    })).then((title){
      if(title != null) {
        addItem(Healthy(title: title));
      }
    });
  }

  void addItem(Healthy item){
    // Insert an item into the top of our list, on index zero
    list.insert(0, item);
    saveData();
  }

  void removeItem(Healthy item){
    list.remove(item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    if(listString != null){
      list = listString.map(
              (item) => Healthy.fromMap(json.decode(item))
      ).toList();
      setState((){});
    }
  }

  void saveData(){
    List<String> stringList = list.map(
            (item) => json.encode(item.toMap()
        )).toList();
    sharedPreferences.setStringList('list', stringList);
  }
}

class Healthy {
  String title;

  Healthy({
    this.title,
  });

  Healthy.fromMap(Map map) :
        this.title = map['title'];

  Map toMap(){
    return {
      'title': this.title,
    };
  }
}

class NewHealthyView extends StatefulWidget {
  final Healthy item;

  NewHealthyView({ this.item });

  @override
  _NewHealthyViewState createState() => _NewHealthyViewState();
}

class _NewHealthyViewState extends State<NewHealthyView> {
  TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = new TextEditingController(
        text: widget.item != null ? widget.item.title : null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 25.0,),
            TextField(
              cursorColor: Colors.black,
              style: TextStyle(fontSize: 25),
              controller: titleController,
              autofocus: true,
              onSubmitted: (value) => submit(),

              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen, width: 3.0),
                ),
                hintText: '건강한 나를 만들어요',
                ),
            ),
            SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.green,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        '취소',
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).primaryTextTheme.title.color
                        ),
                      ),
                    ),
                  ),
                  onPressed: (){
                    setState(() {
                      titleController.clear();
                      Navigator.pop(context);
                    });
                  },
                ),
                SizedBox(width: 50,),
                FlatButton(
                  color: Colors.green,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        '저장',
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).primaryTextTheme.title.color
                        ),
                      ),
                    ),
                  ),
                  onPressed: () => submit(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void submit(){
    Navigator.of(context).pop(titleController.text);
  }
}