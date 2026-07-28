import 'package:spend_time/features/topics/domain/topic_color_key.dart';
import 'package:spend_time/features/topics/domain/topic_icon_key.dart';

class CreateTopicResult {
  const CreateTopicResult({
    required this.name,
    required this.colorKey,
    required this.iconKey,
  });

  final String name;
  final TopicColorKey colorKey;
  final TopicIconKey iconKey;
}
