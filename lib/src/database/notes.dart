// These imports are necessary to open the sqlite3 database

import 'package:drift/drift.dart';

class Notes extends Table {
  TextColumn get content => text().withLength(min: 1, max: 500)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get id => text().withLength(min: 36, max: 36).unique()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get userId => text()
      .withLength(min: 36, max: 36)
      .withDefault(const Constant('00000000-0000-0000-0000-000000000000'))();
}
