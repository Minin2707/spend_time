// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Spend Time';

  @override
  String get welcomeTitle => 'Welcome';

  @override
  String get welcomeMessage => 'What should we call you?';

  @override
  String get nameLabel => 'Name';

  @override
  String get continueButton => 'Continue';

  @override
  String get homeTitle => 'Spend Time';

  @override
  String get noTopicsTitle => 'No topics yet';

  @override
  String get noTopicsSubtitle => 'Create your first topic';

  @override
  String get createTopic => 'Create topic';

  @override
  String get createTopicTitle => 'New topic';

  @override
  String get topicNameLabel => 'Topic name';

  @override
  String get createButton => 'Create';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get todayLabel => 'Today';

  @override
  String get totalLabel => 'Total';

  @override
  String get startButton => 'Start';

  @override
  String get stopButton => 'Stop';

  @override
  String get noSessionHistoryTitle => 'No sessions yet';

  @override
  String get noSessionHistorySubtitle => 'Completed sessions will appear here';

  @override
  String get deleteTopicTitle => 'Delete topic?';

  @override
  String deleteTopicMessage(String topicName) {
    return 'This will delete \"$topicName\" and all of its session history.';
  }

  @override
  String get deleteTopicConfirmButton => 'Delete';

  @override
  String get deleteTopicMenuItem => 'Delete';

  @override
  String get deleteActiveTopicMessage =>
      'Stop the active session before deleting this topic.';

  @override
  String get editTopicTitle => 'Edit topic';

  @override
  String get editTopicNameLabel => 'Topic name';

  @override
  String get editTopicSaveButton => 'Save';

  @override
  String get editTopicMenuItem => 'Edit';

  @override
  String get emptyTopicNameMessage => 'Topic name cannot be empty.';

  @override
  String get updateTopicErrorMessage => 'Could not update topic.';
}
