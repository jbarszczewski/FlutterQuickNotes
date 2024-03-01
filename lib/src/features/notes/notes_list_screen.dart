import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_notes/src/database/database.dart';
import 'package:quick_notes/src/services/sync_service.dart';

class NotesListScreen extends ConsumerWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchNotes = ref.watch(watchNotesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        watchNotes.when(
          data: (notes) => ListView.builder(
            shrinkWrap: true,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                title: Column(
                  children: [
                    Text(note.title),
                    Text('Owner Id: ${note.userId}')
                  ],
                ),
                subtitle: Text(note.content),
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  var title =
                      'New Note ${DateTime.now().millisecondsSinceEpoch}';
                  var content =
                      'This is a new note, added at ${DateTime.now().toIso8601String()}';
                  ref.read(addNoteProvider(title: title, content: content));
                },
                child: const Text('Add Note')),
            ElevatedButton(
                onPressed: () {
                  ref.read(syncNotesProvider);
                },
                child: const Text('Sync Notes')),
          ],
        ),
      ]),
    );
  }
}
