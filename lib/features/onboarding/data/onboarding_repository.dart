import 'package:spend_time/database/app_database.dart';

abstract interface class OnboardingRepository {
  Future<User?> getUser();

  Future<void> saveUser({
    required String name,
  });
}