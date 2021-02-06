import 'package:flutter/material.dart';
import 'package:healthy_me/widgets/comment.dart';
import 'package:healthy_me/widgets/listcomments.dart';
import 'package:healthy_me/widgets/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:healthy_me/widgets/home.dart';
import 'dart:async';
import 'dart:convert';

Future<List<Comment>> fetchComments() async {
  final response = await http.get(
    'https://healthy-me.herokuapp.com/community/addcomments',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return compute(parseComments, utf8.decode(response.bodyBytes));
}

List<Comment> parseComments(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
}

Future<Comment> createComment(
    String post_id, String body, String author) async {
  final http.Response response = await http.post(
    'https://healthy-me.herokuapp.com/community/addcomments',
    // headers: <String, String>{HttpHeaders.authorizationHeader: 'Token f22b0fe1a6406d3866ac5b141ea636412787651f',},
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'post_id': post_id.toString(),
      'body': body.toString(),
      'author': author.toString(),
    }),
  );

  if (response.statusCode == 201) {
    return Comment.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('댓글 작성 실패');
  }
}

class ViewDetailPage extends StatefulWidget {
  final List<Post> posts;
  final String Post_id;

  ViewDetailPage({Key key, this.posts, this.Post_id}) : super(key: key);

  @override
  _ViewDetailPageState createState() => _ViewDetailPageState();
}

class _ViewDetailPageState extends State<ViewDetailPage> {
  final TextEditingController _bodycontroller = TextEditingController();
  final TextEditingController _authorcontroller = TextEditingController();
  String post_id;
  Future<Comment> _futureSendComment;
  Future<Comment> comment;
  Future<List<Comment>> futureComment;

  @override
  void initState() {
    super.initState();
    futureComment = fetchComments();
    post_id = widget.Post_id;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: -6.0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.centerLeft,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(44.0)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: 1.5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.navigate_before,
                  ),
                  SizedBox(
                    width: 355.0,
                  ),
                  Icon(
                    Icons.update,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("커뮤니티",
                      style: const TextStyle(
                          color: const Color(0xff02171a),
                          fontWeight: FontWeight.w400,
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
            Container(
              width: 354,
              constraints:
                  BoxConstraints(minHeight: 100, maxHeight: double.infinity),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Color(0xFF54767A), width: 1)),
              child: Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, position) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${widget.posts[position].title}',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '글번호 ${widget.posts[position].id}',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                '작성자 : ${widget.posts[position].author}',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 5.0,
                          thickness: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 15, 8, 40),
                          child: Text(
                            '${widget.posts[position].body}',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 354,
              constraints:
                  BoxConstraints(minHeight: 100, maxHeight: double.infinity),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xffd3dfe1)),
              child: Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, position) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _bodycontroller,
                                      decoration:
                                          InputDecoration(hintText: '댓글 내용'),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _authorcontroller,
                                      decoration:
                                          InputDecoration(hintText: '작성자'),
                                    ),
                                  ),
                                ],
                              ),
                              FlatButton(
                                color: Color(0xff8AABAE),
                                child: Text('작성'),
                                onPressed: () {
                                  setState(() {
                                    post_id = widget.Post_id;
                                    _futureSendComment = createComment(
                                        post_id,
                                        _bodycontroller.text,
                                        _authorcontroller.text);
                                    _bodycontroller.clear();
                                    _authorcontroller.clear();
                                    futureComment = fetchComments();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: FutureBuilder<List<Comment>>(
                            future: futureComment,
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
                                  ? Flexible(
                                      child: ListViewComments(
                                      comments: snapshot.data,
                                      post_id: post_id,
                                    ))
                                  : Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
