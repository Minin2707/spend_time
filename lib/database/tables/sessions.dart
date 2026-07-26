import 'package:drift/drift.dart';
import 'package:spend_time/database/tables/topics.dart';

class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get topicId => integer().references(
    Topics,
    #id,
    onDelete: KeyAction.cascade,
  )();

  IntColumn get startedAt => integer()();

  IntColumn get endedAt => integer().nullable()();
}