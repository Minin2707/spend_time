import 'package:flutter/material.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';

abstract final class TopicIconMapper {
  static IconData iconFor(
    TopicIconKey iconKey,
  ) {
    return switch (iconKey) {
      TopicIconKey.book => Icons.menu_book_rounded,
      TopicIconKey.laptop => Icons.laptop_mac_rounded,
      TopicIconKey.fitness => Icons.fitness_center_rounded,
      TopicIconKey.globe => Icons.public_rounded,
      TopicIconKey.briefcase => Icons.work_outline_rounded,
      TopicIconKey.heart => Icons.favorite_border_rounded,
      TopicIconKey.music => Icons.music_note_rounded,
      TopicIconKey.pencil => Icons.edit_rounded,
      TopicIconKey.camera => Icons.photo_camera_outlined,
      TopicIconKey.car => Icons.directions_car_filled_rounded,
      TopicIconKey.leaf => Icons.eco_rounded,
      TopicIconKey.more => Icons.more_horiz_rounded,
    };
  }
}
