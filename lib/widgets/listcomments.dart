import 'package:flutter/material.dart';
import 'package:healthy_me/widgets/comment.dart';

class ListViewComments extends StatefulWidget {
  final List<Comment> comments;
  final String post_id;

  ListViewComments({Key key, this.comments,this.post_id}) : super(key: key);

  @override
  _ListViewCommentsState createState() => _ListViewCommentsState();
}

class _ListViewCommentsState extends State<ListViewComments> {
  @override
  void initState() {
    setState(() {
      print(widget.post_id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Comment> reversecomments = List.from(widget.comments.reversed);
    return Container(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        shrinkWrap: true,
        itemCount: widget.comments.length,
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (context, position) {
          if (reversecomments[position].post_id == widget.post_id) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${reversecomments[position].body}',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    '${reversecomments[position].author}',
                    style: new TextStyle(
                      fontSize: 13.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            );
          }
          return Column();
        },
      ),
    );
  }
}
