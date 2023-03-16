class Post{
  final String title;
  final String body;
  final int userId;
  final int id;

  Post({required this.title, required this.body, required this.userId, required this.id});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      id: json['id']
    );
  }
}