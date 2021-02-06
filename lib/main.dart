import 'package:flutter/material.dart';
import 'package:healthy_me/screens/Basic_Page.dart';
import 'package:healthy_me/screens/XD_diary.dart';
import 'package:healthy_me/screens/XD_log_in.dart';
import 'package:healthy_me/screens/XD_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: XD_main(),
      initialRoute: '/',
      routes: {
        '/basic': (context) => BasicPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
