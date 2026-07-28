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

  Future<User?> getUser() async {
    final User? user = await select(users).getSingleOrNull();

    return user;
  }

  Future<int> insertUser(
    final UsersCompanion user,
  ) async {
    final int id = await into(users).insert(user);

    return id;
  }

  Future<bool> updateUser(
      final User user,
      ) {
    return update(users).replace(user);
  }

  Future<int> deleteAllUsers() async {
    final int count = await delete(users).go();

    return count;
  }
}
