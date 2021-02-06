import 'dart:async';
import 'dart:convert';
import 'package:healthy_me/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> createPost(String title, String body, String author) async {
  final http.Response response = await http.post(
    'https://healthy-me.herokuapp.com/community/upload',
    // headers: <String, String>{HttpHeaders.authorizationHeader: 'Token f22b0fe1a6406d3866ac5b141ea636412787651f',},
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title.toString(),
      'body': body.toString(),
      'author': author.toString(),
    }),
  );

  if (response.statusCode == 201) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('게시글 작성 실패');
  }
}

class SendData extends StatefulWidget {
  SendData({Key key}) : super(key: key);

  @override
  _SendDataState createState() {
    return _SendDataState();
  }
}

class _SendDataState extends State<SendData> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _bodycontroller = TextEditingController();
  final TextEditingController _authorcontroller = TextEditingController();
  Future<Post> _futureSendData;
  Future<List<Post>> futurePost;

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
            Text("새글 작성",
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
                    borderRadius: BorderRadius.all(Radius.circular(10),),
                    color: const Color(0xffd3dfe1),),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15,55,15,75),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller: _titlecontroller,
                      decoration: InputDecoration(hintText: '제목'),
                    ),
                    TextField(
                      controller: _bodycontroller,
                      decoration: InputDecoration(hintText: '내용'),
                    ),
                    TextField(
                      controller: _authorcontroller,
                      decoration: InputDecoration(hintText: '작성자'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32,0,32,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _titlecontroller.clear();
                        _bodycontroller.clear();
                        _authorcontroller.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: Image(
                      width: 126,
                      height: 42,
                      image: AssetImage(
                        'image/cancel.PNG',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _futureSendData = createPost(_titlecontroller.text,
                            _bodycontroller.text, _authorcontroller.text);
                        Navigator.pop(context);
                      });
                    },
                    child: Image(
                      width: 126,
                      height: 42,
                      image: AssetImage(
                        'image/save.PNG',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}