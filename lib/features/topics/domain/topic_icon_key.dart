enum TopicIconKey {
  book,
  laptop,
  fitness,
  globe,
  briefcase,
  heart,
  music,
  pencil,
  camera,
  car,
  leaf,
  more;

  String get storageValue {
    return switch (this) {
      TopicIconKey.book => 'book',
      TopicIconKey.laptop => 'laptop',
      TopicIconKey.fitness => 'fitness',
      TopicIconKey.globe => 'globe',
      TopicIconKey.briefcase => 'briefcase',
      TopicIconKey.heart => 'heart',
      TopicIconKey.music => 'music',
      TopicIconKey.pencil => 'pencil',
      TopicIconKey.camera => 'camera',
      TopicIconKey.car => 'car',
      TopicIconKey.leaf => 'leaf',
      TopicIconKey.more => 'more',
    };
  }

  static TopicIconKey fromStorageValue(
    String? value,
  ) {
    return switch (value) {
      'book' => TopicIconKey.book,
      'laptop' => TopicIconKey.laptop,
      'fitness' => TopicIconKey.fitness,
      'globe' => TopicIconKey.globe,
      'briefcase' => TopicIconKey.briefcase,
      'heart' => TopicIconKey.heart,
      'music' => TopicIconKey.music,
      'pencil' => TopicIconKey.pencil,
      'camera' => TopicIconKey.camera,
      'car' => TopicIconKey.car,
      'leaf' => TopicIconKey.leaf,
      'more' => TopicIconKey.more,
      _ => TopicIconKey.book,
    };
  }
}
