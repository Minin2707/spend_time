import 'package:drift/drift.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/database/daos/user_dao.dart';
import 'package:spend_time/features/onboarding/data/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(
      this._userDao,
      );

  final UserDao _userDao;

  @override
  Future<User?> getUser() async {
    final User? user = await _userDao.getUser();

    return user;
  }

  @override
  Future<void> saveUser({
    required final String name,
  }) async {
    await _userDao.deleteAllUsers();

    await _userDao.insertUser(
      UsersCompanion.insert(
        name: name,
        onboardingCompleted: const Value(true),
      ),
    );
  }
}
