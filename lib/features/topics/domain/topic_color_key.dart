enum TopicColorKey {
  blue,
  green,
  orange,
  rose,
  violet,
  teal;

  static TopicColorKey fromStorageValue(
    String value,
  ) {
    return switch (value) {
      'blue' => TopicColorKey.blue,
      'green' => TopicColorKey.green,
      'orange' => TopicColorKey.orange,
      'rose' => TopicColorKey.rose,
      'violet' => TopicColorKey.violet,
      'teal' => TopicColorKey.teal,
      _ => TopicColorKey.blue,
    };
  }

  String get storageValue {
    return switch (this) {
      TopicColorKey.blue => 'blue',
      TopicColorKey.green => 'green',
      TopicColorKey.orange => 'orange',
      TopicColorKey.rose => 'rose',
      TopicColorKey.violet => 'violet',
      TopicColorKey.teal => 'teal',
    };
  }
}
