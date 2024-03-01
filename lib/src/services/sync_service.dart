import 'package:quick_notes/src/database/database.dart';
import 'package:quick_notes/src/services/supabase_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sync_service.g.dart';

@riverpod
Future<void> syncNotes(SyncNotesRef ref) async {
  print('Sync start');
  var supabase = ref.read(supabaseClientProvider);
  var supaNotes = await supabase.from('notes').select('*');
  print('fetched ${supaNotes.length} notes from supabase');
  var notes = await ref.watch(getNotesProvider.future);
  print('Found ${notes.length} to sync');
  for (var note in notes) {
    print('sending note ${note.id} to supabase');
    await supabase.from('notes').upsert({
      'id': note.id,
      'title': note.title,
      'content': note.content,
      'user_id': note.userId,
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    }).count(CountOption.exact);
    print('note ${note.id} upserted');
  }
}
