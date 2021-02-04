import 'package:flutter/material.dart';
import 'package:healthy_me/screens/viewdetailpage.dart';
import 'package:healthy_me/screens/post.dart';

class ListViewPosts extends StatefulWidget {
  final List<Post> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  _ListViewPostsState createState() => _ListViewPostsState();
}

class _ListViewPostsState extends State<ListViewPosts> {
  @override
  Widget build(BuildContext context) {
    List<Post> reverseposts = List.from(widget.posts.reversed);
    return Container(
      child: ListView.builder(
          itemCount: widget.posts.length,
          padding: const EdgeInsets.all(0.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${reverseposts[position].id}',
                      ),
                    ],
                  ),
                  title: Text(
                    '${reverseposts[position].title}',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  trailing: Text(
                    '${reverseposts[position].author}',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
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
