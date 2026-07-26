import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/features/sessions/application/session_notifier.dart';
import 'package:spend_time/features/sessions/application/session_state.dart';

final sessionProvider =
AsyncNotifierProvider<
    SessionNotifier,
    SessionState>(
  SessionNotifier.new,
);