abstract final class DurationFormatter {
  static String formatClock(
      Duration duration,
      ) {
    final int hours = duration.inHours;

    final int minutes =
    duration.inMinutes.remainder(60);

    final int seconds =
    duration.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }
}