import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jc_notes_taking_app_flutter/Components/drawer.dart';
import 'package:jc_notes_taking_app_flutter/Components/note_tile.dart';
import 'package:jc_notes_taking_app_flutter/Models/notes.dart';
import 'package:jc_notes_taking_app_flutter/Models/notes_database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text Controller
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Call function
    readNotes();
  }

  // Create Note
  void createDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    context.read<NotesDatabase>().addNote(textController.text);

                    // Remove existing text
                    textController.clear();

                    // Pop the dialog
                    Navigator.pop(context);
                  },
                  child: const Text("Create Notes"),
                )
              ],
            ));
  }

  void readNotes() {
    // Make sure read without () because read() = wrong
    context.read<NotesDatabase>().fetchNotes();
  }

  void updateNote(Notes notes) {
    // Prefill the controller
    textController.text = notes.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Update Notes"),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    context
                        .read<NotesDatabase>()
                        .updateNote(notes.id, textController.text);

                    // Clear and pop
                    textController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Update Notes"),
                )
              ],
            ));
  }

  void deleteNote(int id) {
    context.read<NotesDatabase>().deleteNotes(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NotesDatabase>();

    // Refer to the list created in the Class
    List<Notes> listOfNotes = noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("Jc Notes"),
        titleTextStyle: GoogleFonts.dmSerifText(fontSize: 30),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createDialog,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Heading
          // Padding(
          //   padding: const EdgeInsets.all(25.0),
          //   child: Text(
          //     'Notes',
          //     style: GoogleFonts.dmSerifText(fontSize: 48),
          //   ),
          // ),

          Expanded(
            child: ListView.builder(
                itemCount: listOfNotes.length,
                itemBuilder: (context, index) {
                  final note = listOfNotes[index];
                  return NoteTile(text: note.text,
                  onDeletePressed: ()=> deleteNote(note.id),
                  onEditPressed: ()=> updateNote(note),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
