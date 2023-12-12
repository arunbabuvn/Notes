import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/notes_model.dart';

class FireStoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  Future<void> addNote(String title, String description) {
    final notesModel = NotesModel(title: title, description: description);
    return notes.add(notesModel.toJson());
  }

  Stream<QuerySnapshot> getNotesStream() {
    return notes.snapshots();
  }
}
