// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('00000000-0000-0000-0000-000000000000'));
  @override
  List<GeneratedColumn> get $columns =>
      [content, createdAt, id, title, updatedAt, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final String content;
  final DateTime createdAt;
  final String id;
  final String title;
  final DateTime? updatedAt;
  final String userId;
  const Note(
      {required this.content,
      required this.createdAt,
      required this.id,
      required this.title,
      this.updatedAt,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['user_id'] = Variable<String>(userId);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      content: Value(content),
      createdAt: Value(createdAt),
      id: Value(id),
      title: Value(title),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      userId: Value(userId),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      userId: serializer.fromJson<String>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'userId': serializer.toJson<String>(userId),
    };
  }

  Note copyWith(
          {String? content,
          DateTime? createdAt,
          String? id,
          String? title,
          Value<DateTime?> updatedAt = const Value.absent(),
          String? userId}) =>
      Note(
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        title: title ?? this.title,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(content, createdAt, id, title, updatedAt, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.id == this.id &&
          other.title == this.title &&
          other.updatedAt == this.updatedAt &&
          other.userId == this.userId);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime?> updatedAt;
  final Value<String> userId;
  final Value<int> rowid;
  const NotesCompanion({
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.userId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String content,
    this.createdAt = const Value.absent(),
    required String id,
    required String title,
    this.updatedAt = const Value.absent(),
    this.userId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : content = Value(content),
        id = Value(id),
        title = Value(title);
  static Insertable<Note> custom({
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? updatedAt,
    Expression<String>? userId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (userId != null) 'user_id': userId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith(
      {Value<String>? content,
      Value<DateTime>? createdAt,
      Value<String>? id,
      Value<String>? title,
      Value<DateTime?>? updatedAt,
      Value<String>? userId,
      Value<int>? rowid}) {
    return NotesCompanion(
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('userId: $userId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $NotesTable notes = $NotesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes];
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addNoteHash() => r'69d833d476c91a304a80a7ccaffe32ac30e7a261';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [addNote].
@ProviderFor(addNote)
const addNoteProvider = AddNoteFamily();

/// See also [addNote].
class AddNoteFamily extends Family<AsyncValue<void>> {
  /// See also [addNote].
  const AddNoteFamily();

  /// See also [addNote].
  AddNoteProvider call({
    required String title,
    required String content,
  }) {
    return AddNoteProvider(
      title: title,
      content: content,
    );
  }

  @override
  AddNoteProvider getProviderOverride(
    covariant AddNoteProvider provider,
  ) {
    return call(
      title: provider.title,
      content: provider.content,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addNoteProvider';
}

/// See also [addNote].
class AddNoteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addNote].
  AddNoteProvider({
    required String title,
    required String content,
  }) : this._internal(
          (ref) => addNote(
            ref as AddNoteRef,
            title: title,
            content: content,
          ),
          from: addNoteProvider,
          name: r'addNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addNoteHash,
          dependencies: AddNoteFamily._dependencies,
          allTransitiveDependencies: AddNoteFamily._allTransitiveDependencies,
          title: title,
          content: content,
        );

  AddNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.content,
  }) : super.internal();

  final String title;
  final String content;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddNoteProvider._internal(
        (ref) => create(ref as AddNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        content: content,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddNoteProvider &&
        other.title == title &&
        other.content == content;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, content.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddNoteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `content` of this provider.
  String get content;
}

class _AddNoteProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddNoteRef {
  _AddNoteProviderElement(super.provider);

  @override
  String get title => (origin as AddNoteProvider).title;
  @override
  String get content => (origin as AddNoteProvider).content;
}

String _$getNotesHash() => r'147d626568fa3c91a13f8436e5b30babfa499aa8';

/// See also [getNotes].
@ProviderFor(getNotes)
final getNotesProvider = AutoDisposeFutureProvider<List<Note>>.internal(
  getNotes,
  name: r'getNotesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getNotesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNotesRef = AutoDisposeFutureProviderRef<List<Note>>;
String _$localDatabaseHash() => r'72053f72c4b10fe84649c6ee361b2ed82091daeb';

/// See also [localDatabase].
@ProviderFor(localDatabase)
final localDatabaseProvider = Provider<AppDatabase>.internal(
  localDatabase,
  name: r'localDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalDatabaseRef = ProviderRef<AppDatabase>;
String _$watchNotesHash() => r'cac978e5b53c898de9adecfc965ff2e16595d6ed';

/// See also [watchNotes].
@ProviderFor(watchNotes)
final watchNotesProvider = AutoDisposeStreamProvider<List<Note>>.internal(
  watchNotes,
  name: r'watchNotesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$watchNotesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchNotesRef = AutoDisposeStreamProviderRef<List<Note>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
