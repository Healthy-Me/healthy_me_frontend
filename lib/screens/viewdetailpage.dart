import 'package:flutter/material.dart';
import 'package:healthy_me/screens/post.dart';

class ViewDetailPage extends StatelessWidget {
  final List<Post> posts;

  ViewDetailPage({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, position) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${posts[position].title}',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '글번호 ${posts[position].id}',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '작성자 : ${posts[position].author}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5.0,
                    thickness: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,15,8,40),
                    child: Text(
                      '${posts[position].body}',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Divider(
                    height: 5.0,
                    thickness: 3,
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
