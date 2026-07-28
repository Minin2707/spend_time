import 'package:drift/drift.dart';

class AppSettings extends Table {
  IntColumn get id => integer()
      .withDefault(
        const Constant<int>(
          1,
        ),
      )();

  TextColumn get themeMode => text().withDefault(
    const Constant<String>(
      'light',
    ),
  )();

  @override
  Set<Column> get primaryKey => {
    id,
  };
}
