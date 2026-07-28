import 'package:drift/drift.dart';

class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get colorKey => text().withDefault(
    const Constant<String>(
      'blue',
    ),
  )();

  IntColumn get createdAt => integer()();
}
