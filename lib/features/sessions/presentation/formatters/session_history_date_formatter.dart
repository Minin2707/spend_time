class SessionHistoryDateFormatter {
  const SessionHistoryDateFormatter._();

  static const List<String> _monthNames = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря',
  ];

  static String format(
    DateTime date,
  ) {
    final DateTime normalizedDate = _dateOnly(
      date,
    );
    final DateTime today = _dateOnly(
      DateTime.now(),
    );
    final DateTime yesterday = DateTime(
      today.year,
      today.month,
      today.day - 1,
    );

    if (normalizedDate == today) {
      return 'Сегодня';
    }

    if (normalizedDate == yesterday) {
      return 'Вчера';
    }

    return '${normalizedDate.day} '
        '${_monthNames[normalizedDate.month - 1]}';
  }

  static DateTime _dateOnly(
    DateTime date,
  ) {
    return DateTime(
      date.year,
      date.month,
      date.day,
    );
  }
}
