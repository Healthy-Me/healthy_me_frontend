import 'package:flutter/material.dart';

class XD_my extends StatefulWidget {
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<XD_my> {
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
            Container(
              width: 354,
              child: Row(
                children: [
                  Text("마이페이지",
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
              height: 40.0,
            ),
            Center(
              child: Image(
                width: 90,
                height: 90,
                image: AssetImage(
                  'image/user.PNG',
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 354,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xffd3dfe1)),
              child: (Center(
                child: Text("YoonJ00",
                    style: const TextStyle(
                        color: const Color(0xff02171a),
                        fontWeight: FontWeight.bold,
                        fontFamily: "SpoqaHanSansNeo",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.left),
              )),
            ),
            SizedBox(
              height: 255.0,
            ),
          ],
        ),
      ),
    );
  }
}
