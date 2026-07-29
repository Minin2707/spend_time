import 'package:flutter/material.dart';
import 'package:spend_time/features/topics/domain/topic_color_key.dart';

abstract final class TopicColorPalette {
  static Color colorFor({
    required TopicColorKey colorKey,
    required Brightness brightness,
  }) {
    return switch (brightness) {
      Brightness.light => _lightColorFor(
          colorKey,
        ),
      Brightness.dark => _darkColorFor(
          colorKey,
        ),
    };
  }

  static Color _lightColorFor(
    TopicColorKey colorKey,
  ) {
    return switch (colorKey) {
      TopicColorKey.blue => const Color(0xFF3B82F6),
      TopicColorKey.green => const Color(0xFF22C55E),
      TopicColorKey.orange => const Color(0xFFF59E0B),
      TopicColorKey.rose => const Color(0xFFE11D48),
      TopicColorKey.violet => const Color(0xFF8B5CF6),
      TopicColorKey.teal => const Color(0xFF14B8A6),
      TopicColorKey.cyan => const Color(0xFF0891B2),
      TopicColorKey.lime => const Color(0xFF65A30D),
      TopicColorKey.yellow => const Color(0xFFCA8A04),
      TopicColorKey.red => const Color(0xFFDC2626),
      TopicColorKey.pink => const Color(0xFFDB2777),
      TopicColorKey.indigo => const Color(0xFF4F46E5),
    };
  }

  static Color _darkColorFor(
    TopicColorKey colorKey,
  ) {
    return switch (colorKey) {
      TopicColorKey.blue => const Color(0xFF60A5FA),
      TopicColorKey.green => const Color(0xFF4ADE80),
      TopicColorKey.orange => const Color(0xFFFBBF24),
      TopicColorKey.rose => const Color(0xFFFB7185),
      TopicColorKey.violet => const Color(0xFFA78BFA),
      TopicColorKey.teal => const Color(0xFF2DD4BF),
      TopicColorKey.cyan => const Color(0xFF22D3EE),
      TopicColorKey.lime => const Color(0xFFA3E635),
      TopicColorKey.yellow => const Color(0xFFFACC15),
      TopicColorKey.red => const Color(0xFFF87171),
      TopicColorKey.pink => const Color(0xFFF472B6),
      TopicColorKey.indigo => const Color(0xFF818CF8),
    };
  }
}
