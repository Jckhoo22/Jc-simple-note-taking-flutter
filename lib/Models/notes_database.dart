import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:jc_notes_taking_app_flutter/Models/notes.dart';
import 'package:path_provider/path_provider.dart';

class NotesDatabase extends ChangeNotifier {
  static late Isar isar;

  // INITIALIZE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NotesSchema], directory: dir.path);
  }

  // All the notes
  final List<Notes> currentNotes = [];

  // CREATE a note and save to db
  Future<void> addNote(String textFromUser) async {
    // Create an Object
    final newNote = Notes()..text = textFromUser;

    // Write the Objet
    await isar.writeTxn(() => isar.notes.put(newNote));

    // Refresh and re-read
    await fetchNotes();

    // State Management
    notifyListeners();
  }

  // READ a note in the db
  Future<void> fetchNotes() async {
    List<Notes> fetchNotes = await isar.notes.where().findAll();

    // remove and add again to re-read
    currentNotes.clear();

    currentNotes.addAll(fetchNotes);

    // State Management
    notifyListeners();
  }

  // UPDATE a note and save to db
  Future<void> updateNote(int id, String newText) async {
    // Get the index of the note based on ID
    final existingNote = await isar.notes.get(id);

    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // DELETE a note from db
  Future<void> deleteNotes(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
