class Comment {
  final int id;
  final String post_id;
  final String body;
  final String author;

  Comment({
    this.id,
    this.post_id,
    this.body,
    this.author,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json['id'] as int,
    post_id: json['post_id'] as String,
    body: json['body'] as String,
    author: json['author'] as String,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_id": post_id,
    "body": body,
    "author": author,
  };
}
