import 'package:spend_time/core/time/clock.dart';
import 'package:spend_time/core/time/ticker.dart';

class SystemTicker implements Ticker {
  SystemTicker({
    required Clock clock,
  }) : _clock = clock;

  final Clock _clock;

  @override
  Stream<DateTime> tick({
    Duration interval = const Duration(
      seconds: 1,
    ),
  }) {
    return Stream.periodic(
      interval,
          (_) => _clock.now(),
    );
  }
}