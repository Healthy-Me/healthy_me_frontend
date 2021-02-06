import 'package:flutter/material.dart';
import 'package:healthy_me/screens/XD_diary.dart';
import 'package:healthy_me/screens/XD_medicine.dart';
import 'package:healthy_me/screens/XD_my.dart';
import 'package:healthy_me/widgets/home.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Basic(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Basic extends StatefulWidget {
  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  int _currentindex = 0;
  final List<Widget> _screen = [
    HomePage(),
    XD_diary(),
    XD_medicine(),
    XD_my(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentindex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
            selectedFontSize: 10.0,
            selectedItemColor: Color(0xff54767a),
            unselectedFontSize: 10.0,
            unselectedItemColor: Color(0xffbac9cb),
            type: BottomNavigationBarType.fixed,
            elevation: 5.0,
            onTap: _onTap,
            currentIndex: _currentindex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                ),
                title: Text("home",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  size: 30,
                ),
                title: Text("diary",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.medical_services_rounded,
                  size: 30,
                ),
                title: Text("medicine",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                title: Text("my",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "SpoqaHanSansNeo",
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.left),
              ),
            ]),
      ),
    );
  }
}
