import 'package:spend_time/core/time/clock.dart';

class SystemClock implements Clock {
  @override
  DateTime now() {
    return DateTime.now();
  }
}