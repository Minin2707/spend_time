class ActiveTopicDeletionException implements Exception {
  const ActiveTopicDeletionException({
    required this.topicId,
  });

  final int topicId;
}
