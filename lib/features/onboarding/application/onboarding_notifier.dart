import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/onboarding/data/onboarding_repository.dart';
import 'package:spend_time/features/onboarding/data/onboarding_repository_provider.dart';

class OnboardingNotifier extends AsyncNotifier<User?> {
  late final OnboardingRepository _repository;

  @override
  Future<User?> build() async {
    _repository = ref.watch(onboardingRepositoryProvider);

    return _repository.getUser();
  }

  Future<void> saveUser({
    required final String name,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _repository.saveUser(name: name);
      final User? user = await _repository.getUser();

      return user;
    });
  }
}
