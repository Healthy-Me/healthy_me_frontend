import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:healthy_me/screens/home.dart';
import 'package:healthy_me/screens/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> createPost(String title, String body,String author) async {
  final http.Response response = await http.post(
    'https://healthy-me.herokuapp.com/community/upload',
    headers: <String, String>{HttpHeaders.authorizationHeader: 'Token f22b0fe1a6406d3866ac5b141ea636412787651f',},
    // headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // },
    body: jsonEncode(<String, String>{
      'title': title,
      'body': body,
      'author': author,
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

  @override
  void initState() {
    super.initState();
    futurePost = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '새 글 작성',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('새 글 작성'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureSendData == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                    ElevatedButton(
                      child: Text('Create Data'),
                      onPressed: () {
                        setState(() {
                          _futureSendData = createPost(
                              _titlecontroller.text, _bodycontroller.text, _authorcontroller.text);
                        });
                      },
                    ),
                  ],
                )
              : FutureBuilder<Post>(
                  future: _futureSendData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Text(snapshot.data.title == null
                              ? 'null'
                              : snapshot.data.title),
                          Text(snapshot.data.body == null
                              ? 'null'
                              : snapshot.data.body),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
        ),
      ),
    );
  }
}
