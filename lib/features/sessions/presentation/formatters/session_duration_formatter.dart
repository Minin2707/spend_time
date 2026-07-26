class SessionDurationFormatter {
  const SessionDurationFormatter._();

  static String format(
    Duration duration,
  ) {
    final int hours = duration.inHours;
    final int minutes = duration.inMinutes.remainder(
      60,
    );

    if (hours == 0) {
      return '${duration.inMinutes} мин';
    }

    return '$hours ч ${minutes.toString().padLeft(
      2,
      '0',
    )} мин';
  }
}
