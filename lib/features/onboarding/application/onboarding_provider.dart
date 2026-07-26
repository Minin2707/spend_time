import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/database/app_database.dart';
import 'package:spend_time/features/onboarding/application/onboarding_notifier.dart';

final onboardingProvider =
AsyncNotifierProvider<OnboardingNotifier, User?>(
  OnboardingNotifier.new,
);