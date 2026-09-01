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

  Note copyWith({String? title, String? description}) {
    return Note(
      id: id,
      title: title ?? this.title,
      createdAt: createdAt,
      description: description ?? this.description,
    );
  }
}
