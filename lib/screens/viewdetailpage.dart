import 'package:flutter/material.dart';
import 'package:healthy_me/screens/post.dart';

class ViewDetailPage extends StatelessWidget {
  final List<Post> posts;

  ViewDetailPage({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, position) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${posts[position].title}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '글 번호 ${posts[position].id}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'User ${posts[position].userId}',
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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${posts[position].body}',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
