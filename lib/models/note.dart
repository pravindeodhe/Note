class Note {
  const Note({
    required this.id,
    required this.title,
    required this.createdAt,
    this.description = '',
  });

  final String id;
  final String title;
  final DateTime createdAt;
  final String description;

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'description': description,
    };
  }

  Note copyWith({String? title, String? description}) {
    return Note(
      id: id,
      title: title ?? this.title,
      createdAt: createdAt,
      description: description ?? this.description,
    );
  }
}
