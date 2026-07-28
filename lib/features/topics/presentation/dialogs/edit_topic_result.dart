import 'package:spend_time/features/topics/domain/topic_color_key.dart';

class EditTopicResult {
  const EditTopicResult({
    required this.name,
    required this.colorKey,
  });

  final String name;
  final TopicColorKey colorKey;
}
