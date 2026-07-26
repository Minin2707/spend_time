import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/time/clock_provider.dart';
import 'package:spend_time/core/time/system_ticker.dart';
import 'package:spend_time/core/time/ticker.dart';

final tickerProvider = Provider<Ticker>(
      (ref) {
    final clock = ref.watch(
      clockProvider,
    );

    return SystemTicker(
      clock: clock,
    );
  },
);