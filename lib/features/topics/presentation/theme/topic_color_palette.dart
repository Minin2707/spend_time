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
    };
  }
}
