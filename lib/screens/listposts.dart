import 'package:flutter/material.dart';
import 'package:healthy_me/screens/viewdetailpage.dart';
import 'package:healthy_me/screens/post.dart';

class ListViewPosts extends StatelessWidget {
  final List<Post> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Post> reverseposts = List.from(posts.reversed);
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${reverseposts[position].title}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  trailing: Text(
                    'User ${reverseposts[position].userId}',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${reverseposts[position].id}',
                      ),
                    ],
                  ),
                  onTap: () => _onTapItem(context, reverseposts[position]),
                ),
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Post post) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ViewDetailPage(
          posts: [post],
        ),
      ),
    );
  }
}
