import 'package:quick_notes/src/database/database.dart';
import 'package:quick_notes/src/services/supabase_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_service.g.dart';

@riverpod
Future<void> syncNotes(SyncNotesRef ref) async {
  var notes = await ref.watch(getNotesProvider.future);
  var supabase = ref.watch(supabaseClientProvider);
  for (var note in notes) {
    supabase.from('notes').upsert({
      'id': note.id,
      'title': note.title,
      'content': note.content,
      'userId': note.userId,
    });
  }
}
