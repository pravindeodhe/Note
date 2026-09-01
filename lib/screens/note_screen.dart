import 'package:flutter/material.dart';
import 'package:note/models/note.dart';
import 'package:note/widgets/empty_notes.dart';

import '../widgets/note_card.dart';
import 'add_note_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesScreen> {
  final List<Note> _notes = <Note>[];

  Future<void> _openEditor({Note? noteToEdit}) async {
    final Note? result = await Navigator.of(context).push<Note>(
      MaterialPageRoute<Note>(
        builder: (_) => AddNoteScreen(noteToEdit: noteToEdit),
      ),
    );

    if (result == null) return;
    if (!mounted) return;

    setState(() {
      if (noteToEdit == null) {
        _notes.insert(0, result);
      } else {
        final int index = _notes.indexWhere((Note n) => n.id == result.id);
        if (index != -1) _notes[index] = result;
      }
    });
  }

  void _deleteNote(Note note) {
    final int index = _notes.indexOf(note);
    if (index == -1) return;

    setState(() => _notes.removeAt(index));

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Note deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () => setState(() => _notes.insert(index, note)),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Notes',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          if (_notes.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: Text(
                  '${_notes.length} saved',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
        ],
      ),
      body: _notes.isEmpty ? const EmptyNotesView() : _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _openEditor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 100),
      itemCount: _notes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (BuildContext context, int index) {
        final Note note = _notes[index];
        return NoteCard(
          note: note,
          onTap: () => _openEditor(noteToEdit: note),
          onDelete: () => _deleteNote(note),
        );
      },
    );
  }
}