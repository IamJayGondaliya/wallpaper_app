class Posts {
  final int id;
  final int userId;
  final String title;
  final String body;

  Posts({
    required this.id,
    required this.body,
    required this.title,
    required this.userId,
  });

  factory Posts.fromMap({required Map data}) {
    return Posts(
      id: data['id'],
      body: data['body'],
      title: data['title'],
      userId: data['userId'],
    );
  }
}
