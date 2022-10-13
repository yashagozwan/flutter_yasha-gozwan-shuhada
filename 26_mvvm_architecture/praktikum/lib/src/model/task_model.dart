class Task {
  int? id;
  String title;
  String body;
  bool isDone;
  int createdAt;
  int userId;

  Task({
    this.id,
    required this.title,
    required this.body,
    required this.isDone,
    required this.createdAt,
    required this.userId,
  });

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      id: data['id'],
      title: data['title'],
      isDone: data['isDone'] == 1 ? true : false,
      body: data['body'],
      createdAt: data['createdAt'],
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'isDone': isDone ? 1 : 0,
      'userId': userId,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return 'User={id=$id, title=$title, body=$body, isDone=$isDone, createdAt=$createdAt, userId=$userId}';
  }
}
