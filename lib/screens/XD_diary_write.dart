import 'package:flutter/material.dart';

class XD_diary_write extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<XD_diary_write> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
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
            Text("오늘의 나 기록",
                style: const TextStyle(
                    color: const Color(0xff02171a),
                    fontWeight: FontWeight.w400,
                    fontFamily: "SpoqaHanSansNeo",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
            SizedBox(
              height: 40.0,
            ),
            Container(
                width: 354,
                height: 355,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: const Color(0xffd3dfe1))),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 63.0,
                ),
                Image(
                  width: 126,
                  height: 42,
                  image: AssetImage(
                    'image/cancel.PNG',
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Image(
                  width: 126,
                  height: 42,
                  image: AssetImage(
                    'image/save.PNG',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.0,
            ),
            Stack(
              children: <Widget>[
                Container(
                    width: 420,
                    height: 74,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x4d83a1a5),
                              offset: Offset(0, 0),
                              blurRadius: 30,
                              spreadRadius: 0)
                        ],
                        color: const Color(0xffffffff))),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 57.0,
                    ),
                    Image(
                      width: 35.9,
                      height: 50.3,
                      image: AssetImage(
                        'image/home_bar.png',
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Image(
                      width: 35.9,
                      height: 50.3,
                      image: AssetImage(
                        'image/diary_bar.png',
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Image(
                      width: 43.9,
                      height: 58.3,
                      image: AssetImage(
                        'image/medicine_bar.png',
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Image(
                      width: 30.9,
                      height: 45.3,
                      image: AssetImage(
                        'image/my_bar.png',
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
