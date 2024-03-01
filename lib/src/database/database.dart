// These imports are necessary to open the sqlite3 database
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:quick_notes/src/database/notes.dart';
import 'package:quick_notes/src/services/supabase_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@riverpod
Future<void> addNote(AddNoteRef ref,
    {required String title, required String content}) async {
  var currentUserId = ref.watch(supabaseClientProvider).auth.currentUser!.id;
  var database = ref.read(localDatabaseProvider);
  var uuid = const Uuid();
  database.into(database.notes).insert(
        NotesCompanion.insert(
            id: uuid.v4(),
            title: title,
            content: content,
            userId: Value(currentUserId)),
      );
}

@riverpod
Future<List<Note>> getNotes(GetNotesRef ref) {
  return ref
      .watch(localDatabaseProvider)
      .select(ref.watch(localDatabaseProvider).notes)
      .get();
}

@Riverpod(keepAlive: true)
AppDatabase localDatabase(LocalDatabaseRef ref) {
  return AppDatabase();
}

@riverpod
Stream<List<Note>> watchNotes(WatchNotesRef ref) {
  return ref
      .watch(localDatabaseProvider)
      .select(ref.watch(localDatabaseProvider).notes)
      .watch();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // we added the userId property in the change from version 1 to
          // version 2
          await m.addColumn(notes, notes.userId);
        }
      },
      // beforeOpen: (details) async {
      //   if (details.wasCreated) {
      //     var userId = Supabase.instance.client.auth.currentUser!.id;
      //     await update(notes).write(NotesCompanion(userId: Value(userId)));
      //   }
      // },
    );
  }

  @override
  int get schemaVersion => 2;
}
