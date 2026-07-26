import 'package:drift/drift.dart';

class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get createdAt => integer()();
}