import 'package:spend_time/features/topics/domain/topic_color_key.dart';

class CreateTopicResult {
  const CreateTopicResult({
    required this.name,
    required this.colorKey,
  });

  final String name;
  final TopicColorKey colorKey;
}
