import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';

class EditTopicRouteArgs {
  const EditTopicRouteArgs({
    required this.initialName,
    required this.initialColor,
    required this.initialIcon,
  });

  final String initialName;
  final TopicColorKey initialColor;
  final TopicIconKey initialIcon;
}
