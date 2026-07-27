import 'package:flutter/material.dart';

abstract final class TopicDistributionPalette {
  static const List<Color> _colors = [
    Color(0xFF3B82F6),
    Color(0xFF22C55E),
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
    Color(0xFF8B5CF6),
    Color(0xFF14B8A6),
  ];

  static Color colorFor(
    int index,
  ) {
    return _colors[index % _colors.length];
  }
}
