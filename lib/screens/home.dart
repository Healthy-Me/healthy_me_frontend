import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:healthy_me/screens/senddata.dart';
import 'package:http/http.dart' as http;
import 'package:healthy_me/screens/post.dart';
import 'package:healthy_me/screens/listposts.dart';

Future<List<Post>> fetchPosts() async {
  final response = await http.get(
    'https://healthy-me.herokuapp.com/community/post',
    headers: {
      HttpHeaders.authorizationHeader:
          'Token f22b0fe1a6406d3866ac5b141ea636412787651f',
    },
  );

  return compute(parsePosts, response.body);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Post>>(
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
                              title: Center(
                                child: Text(
                                  '제목',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.deepOrangeAccent,
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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SendData(),
              ),
            );
          },
        ),
      ),
    );
  }
}
