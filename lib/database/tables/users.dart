import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(
    min: 1,
    max: 50,
  )();

  BoolColumn get onboardingCompleted => boolean().withDefault(
    const Constant(false),
  )();
}