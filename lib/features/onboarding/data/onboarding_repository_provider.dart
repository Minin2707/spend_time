import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/database/providers/database_provider.dart';
import 'package:spend_time/features/onboarding/data/onboarding_repository.dart';
import 'package:spend_time/features/onboarding/data/onboarding_repository_impl.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>(
      (ref) {
    final database = ref.watch(databaseProvider);

    return OnboardingRepositoryImpl(
      database.userDao,
    );
  },
);