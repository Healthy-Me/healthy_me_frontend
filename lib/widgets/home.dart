import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:healthy_me/widgets/senddata.dart';
import 'package:http/http.dart' as http;
import 'package:healthy_me/widgets/post.dart';
import 'package:healthy_me/widgets/listposts.dart';

Future<List<Post>> fetchPosts() async {
  final response = await http.get(
    'https://healthy-me.herokuapp.com/community/post',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return compute(parsePosts, utf8.decode(response.bodyBytes));
}

List<Post> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPosts();
  }

  Widget _futurebuilder() {
    return FutureBuilder<List<Post>>(
      future: futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                child: Text(
                  "불러오기 오류",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ],
          );
        }

        return snapshot.hasData
            ? Column(
                children: [
                  Material(
                    elevation: 5,
                    child: Container(
                      height: 50,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        children: [
                          ListTile(
                            tileColor: Color(0xffd3dfe1),
                            title: Center(
                              child: Text(
                                '제목',
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            trailing: Text(
                              '작성자',
                              style: new TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '글 번호',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: ListViewPosts(posts: snapshot.data)),
                ],
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

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
                  Text("커뮤니티",
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
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: 354,
                height: 412,
                child: _futurebuilder(),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(0),
        child: FloatingActionButton(
            backgroundColor: Colors.grey,
            child: Icon(Icons.add),
            onPressed: () {
              navigateSecondPage();
            }),
      ),
    );
  }

  onGoBack(dynamic value) {
    setState(() {
      futurePost = fetchPosts();
    });
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => SendData());
    Navigator.push(context, route).then(onGoBack);
  }
}
