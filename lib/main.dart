import 'package:flutter/material.dart';
import 'package:healthy_me/screens/home.dart';

void main() => runApp(
    MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Healthy Me';

    return MaterialApp(
      title: appTitle,
      home: HomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}
