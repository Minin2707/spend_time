import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/time/clock.dart';
import 'package:spend_time/core/time/clock_provider.dart';
import 'package:spend_time/core/time/ticker.dart';
import 'package:spend_time/core/time/ticker_provider.dart';
import 'package:spend_time/features/sessions/application/session_history_provider.dart';
import 'package:spend_time/features/sessions/application/session_state.dart';
import 'package:spend_time/features/sessions/data/session_repository.dart';
import 'package:spend_time/features/sessions/data/session_repository_provider.dart';
import 'package:spend_time/features/statistics/application/statistics_provider.dart';
import 'package:spend_time/features/statistics/domain/statistics_period.dart';
import 'package:spend_time/features/topics/application/topic_statistics_provider.dart';

class SessionNotifier extends AsyncNotifier<SessionState> {
  late final SessionRepository _repository;
  late final Clock _clock;
  StreamSubscription<DateTime>? _tickerSubscription;
  late final Ticker _ticker;

  @override
  Future<SessionState> build() async {
    _clock = ref.read(
      clockProvider,
    );
    _ticker = ref.read(
      tickerProvider,
    );
    _repository = ref.read(
      sessionRepositoryProvider,
    );

    final activeSession =
    await _repository.getActiveSession();

    ref.onDispose(() async {
      await _tickerSubscription?.cancel();
      _tickerSubscription = null;
    });

    if (activeSession != null) {
      _startTicker();
    }

    return SessionState(
      activeSession: activeSession,
      currentTime: _clock.now(),
    );
  }

  Future<void> _startTicker() async {
    await _tickerSubscription?.cancel();

    _tickerSubscription = _ticker.tick().listen(
          (now) {
        final SessionState? currentState = state.value;

        if (currentState == null) {
          return;
        }

        state = AsyncData(
          currentState.copyWith(
            currentTime: now,
          ),
        );
      },
    );
  }

  Future<void> startSession({
    required int topicId,
  }) async {
    final SessionState currentState =
        state.value ?? const SessionState();

    if (currentState.hasActiveSession) {
      return;
    }

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final session =
      await _repository.startSession(
        topicId: topicId,
        startedAt: _clock.now(),
      );

      await _startTicker();

      return SessionState(
        activeSession: session,
        currentTime: _clock.now(),
      );
    });
  }

  Future<void> stopSession() async {
    final currentState =
        state.value ?? const SessionState();

    final session =
        currentState.activeSession;

    if (session == null) {
      return;
    }

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _repository.stopSession(
        session: session,
        endedAt: _clock.now(),
      );
      await _tickerSubscription?.cancel();
      _tickerSubscription = null;

      _invalidateCompletedSessionReadModels(
        session.topicId,
      );

      return const SessionState();
    });
  }

  void _invalidateCompletedSessionReadModels(
    int topicId,
  ) {
    ref.invalidate(
      topicStatisticsProvider(
        topicId,
      ),
    );
    ref.invalidate(
      sessionHistoryProvider(
        topicId,
      ),
    );

    for (final StatisticsPeriod period in StatisticsPeriod.values) {
      ref
        ..invalidate(
          statisticsProvider(
            period,
          ),
        )
        ..invalidate(
          topicDistributionProvider(
            period,
          ),
        );
    }
  }
}
