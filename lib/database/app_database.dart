import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:spend_time/database/daos/session_dao.dart';
import 'package:spend_time/database/daos/topic_dao.dart';
import 'package:spend_time/database/daos/user_dao.dart';
import 'package:spend_time/database/tables/sessions.dart';
import 'package:spend_time/database/tables/topics.dart';
import 'package:spend_time/database/tables/users.dart';





part 'app_database.g.dart';


@DriftDatabase(
  tables: [
    Users,
    Topics,
    Sessions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator migrator) async {
      await migrator.createAll();
    },
    onUpgrade: (
        Migrator migrator,
        int from,
        int to,
        ) async {
      if (from < 2) {
        await migrator.createTable(
          sessions,
        );
      }
    },
    beforeOpen: (OpeningDetails details) async {
      await customStatement(
        'PRAGMA foreign_keys = ON',
      );
      // Дополнительная настройка базы.
    },
  );
  UserDao get userDao => UserDao(this);
  TopicDao get topicDao => TopicDao(this);
  SessionDao get sessionDao => SessionDao(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory directory = await getApplicationDocumentsDirectory();

    final File file = File(
      p.join(
        directory.path,
        'spend_time.sqlite',
      ),
    );

    return NativeDatabase.createInBackground(file);
  });
}
