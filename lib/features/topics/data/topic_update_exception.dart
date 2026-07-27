class TopicUpdateException implements Exception {
  const TopicUpdateException({
    required this.topicId,
  });

  final int topicId;
}
