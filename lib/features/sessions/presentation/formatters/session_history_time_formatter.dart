class SessionHistoryTimeFormatter {
  const SessionHistoryTimeFormatter._();

  static String format(
    DateTime time,
  ) {
    final String hours = time.hour.toString().padLeft(
      2,
      '0',
    );
    final String minutes = time.minute.toString().padLeft(
      2,
      '0',
    );

    return '$hours:$minutes';
  }
}
