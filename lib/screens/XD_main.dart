import 'package:flutter/material.dart';
import 'package:healthy_me/screens/XD_log_in.dart';
import 'package:healthy_me/screens/register.dart';

class XD_main extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<XD_main> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffccdcde),
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Center(
              child: Image(
                width: 500.0,
                height: 150.38,
                image: AssetImage(
                  'image/main_round.PNG',
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Image(
                    width: 80.0,
                    height: 113.77,
                    image: AssetImage(
                      'image/main_logo.PNG',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Image(
                    width: 408.0,
                    height: 399.77,
                    image: AssetImage(
                      'image/main_visual_.PNG',
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minWidth: 350.0,
                  height: 45.0,
                  child: RaisedButton(
                    color: Color(0xff77a4a8),
                    child: Text(
                      '로그인',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => XD_log_in(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minWidth: 350.0,
                  height: 45.0,
                  child: RaisedButton(
                    color: Color(0xff54767a),
                    child: Text(
                      '회원가입',
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
