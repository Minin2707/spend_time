enum TopicColorKey {
  blue,
  green,
  orange,
  rose,
  violet,
  teal,
  cyan,
  lime,
  yellow,
  red,
  pink,
  indigo;

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
      'cyan' => TopicColorKey.cyan,
      'lime' => TopicColorKey.lime,
      'yellow' => TopicColorKey.yellow,
      'red' => TopicColorKey.red,
      'pink' => TopicColorKey.pink,
      'indigo' => TopicColorKey.indigo,
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
      TopicColorKey.cyan => 'cyan',
      TopicColorKey.lime => 'lime',
      TopicColorKey.yellow => 'yellow',
      TopicColorKey.red => 'red',
      TopicColorKey.pink => 'pink',
      TopicColorKey.indigo => 'indigo',
    };
  }
}
