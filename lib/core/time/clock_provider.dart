import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_time/core/time/clock.dart';
import 'package:spend_time/core/time/system_clock.dart';

final clockProvider = Provider<Clock>(
      (ref) => SystemClock(),
);