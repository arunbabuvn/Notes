class NotesModel {
  String title;
  String description;

  NotesModel({
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory NotesModel.fromMap(doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NotesModel(
      title: data['title'],
      description: data['description'],
    );
  }
}
