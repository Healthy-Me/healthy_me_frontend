import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:healthy_me/screens/post.dart';
import 'package:healthy_me/screens/listposts.dart';

Future<List<Post>> fetchPosts(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/posts');

  return compute(parsePosts, response.body);
}

List<Post> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(http.Client()),
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
          onPressed: (){},
        ),
      ),
    );
  }
}
