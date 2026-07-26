import 'package:drift/drift.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/tables/users.dart';

part 'user_dao.g.dart';

@DriftAccessor(
  tables: [
    Users,
  ],
)
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(
      super.database,
      );

  Future<User?> getUser() {
    return select(users).getSingleOrNull();
  }

  Future<int> insertUser(
      final UsersCompanion user,
      ) {
    return into(users).insert(user);
  }

  Future<bool> updateUser(
      final User user,
      ) {
    return update(users).replace(user);
  }

  Future<int> deleteAllUsers() {
    return delete(users).go();
  }
}