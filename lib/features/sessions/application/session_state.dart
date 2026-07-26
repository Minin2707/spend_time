import 'package:spend_time/database/app_database.dart';

class SessionState {
  const SessionState({
    this.activeSession,
    this.currentTime,
  });

  final Session? activeSession;

  final DateTime? currentTime;

  bool get hasActiveSession =>
      activeSession != null;

  Duration get elapsed {
    if (activeSession == null ||
        currentTime == null) {
      return Duration.zero;
    }

    final startedAt =
    DateTime.fromMillisecondsSinceEpoch(
      activeSession!.startedAt,
    );

    return currentTime!.difference(
      startedAt,
    );
  }

  SessionState copyWith({
    Session? activeSession,
    DateTime? currentTime,
    bool clearActiveSession = false,
  }) {
    return SessionState(
      activeSession: clearActiveSession
          ? null
          : activeSession ?? this.activeSession,
      currentTime:
      currentTime ?? this.currentTime,
    );
  }
}