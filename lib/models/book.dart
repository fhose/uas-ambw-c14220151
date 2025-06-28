class Book {
  final String id;
  final String userId;
  final String title;
  final String author;
  final String status;

  Book({
    required this.id,
    required this.userId,
    required this.title,
    required this.author,
    required this.status,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      userId: map['user_id'],
      title: map['title'],
      author: map['author'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'author': author,
      'status': status,
    };
  }
}
