abstract interface class Ticker {
  Stream<DateTime> tick({
    Duration interval = const Duration(
      seconds: 1,
    ),
  });
}