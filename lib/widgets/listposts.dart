import 'package:flutter/material.dart';
import 'package:healthy_me/widgets/comment.dart';
import 'package:healthy_me/widgets/viewdetailpage.dart';
import 'package:healthy_me/widgets/post.dart';

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
      color: const Color(0xffd3dfe1),
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
                        style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    '${reverseposts[position].title}',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    '${reverseposts[position].author}',
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onTap: () => _onTapItem(context, reverseposts[position], reverseposts[position].id.toString()),
                ),
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Post post, String post_id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ViewDetailPage(
          posts: [post],
          Post_id: post_id,
        ),
      ),
    );
  }
}
