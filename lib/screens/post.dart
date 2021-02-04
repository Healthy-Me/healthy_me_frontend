import 'dart:convert';

Post userModelFromJson(String str) => Post.fromJson(json.decode(str));

String userModelToJson(Post data) => json.encode(data.toJson());

class Post {
  final int id;
  final String title;
  final String body;
  final String author;

  Post({
    this.id,
    this.title,
    this.body,
    this.author,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
        author: json['author'] as String,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "author": author,
  };
}
