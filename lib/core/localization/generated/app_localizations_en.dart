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
  String get navigationTopics => 'Topics';

  @override
  String get navigationStatistics => 'Statistics';

  @override
  String get navigationSettings => 'Settings';

  @override
  String get createTopicTitle => 'New topic';

  @override
  String get topicNameLabel => 'Topic name';

  @override
  String get topicNameHint => 'Enter topic name';

  @override
  String get topicIconSectionTitle => 'Icon';

  @override
  String get topicColorSectionTitle => 'Color';

  @override
  String get closeButtonTooltip => 'Close';

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
  String get createTopicErrorMessage => 'Could not create topic.';

  @override
  String get updateTopicErrorMessage => 'Could not update topic.';

  @override
  String get themeModeLight => 'Light';

  @override
  String get themeModeDark => 'Dark';

  @override
  String get languageSystem => 'System';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageRussian => 'Russian';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get appearanceSectionTitle => 'Appearance';

  @override
  String get languageSectionTitle => 'Language';

  @override
  String get feedbackSectionTitle => 'Support';

  @override
  String get feedbackTitle => 'Feedback';

  @override
  String get feedbackSubtitle => 'Send feedback or report a problem';

  @override
  String get feedbackEmailSubject => 'Spend Time feedback';

  @override
  String feedbackEmailBody(String version, String buildNumber) {
    return 'Describe your suggestion or problem here.\n\nApp version: $version\nBuild: $buildNumber';
  }

  @override
  String get openEmailErrorMessage => 'Could not open your email app.';

  @override
  String get aboutSectionTitle => 'About';

  @override
  String get aboutAppTitle => 'About Spend Time';

  @override
  String get aboutAppDescription =>
      'A simple local time tracker for your topics.';

  @override
  String get aboutLocalDataDescription =>
      'Your data is stored only on this device.';

  @override
  String appVersionLabel(String version, String buildNumber) {
    return 'Version $version ($buildNumber)';
  }

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get updateThemeErrorMessage => 'Could not update theme.';

  @override
  String get updateLanguageErrorMessage =>
      'Could not change the language. Please try again.';

  @override
  String get noStatisticsDistributionTitle => 'No distribution yet';

  @override
  String get noStatisticsDistributionSubtitle =>
      'Completed sessions will appear here.';

  @override
  String get statisticsPeriodToday => 'Today';

  @override
  String get statisticsPeriodWeek => 'Week';

  @override
  String get statisticsPeriodMonth => 'Month';

  @override
  String get statisticsPeriodYear => 'Year';

  @override
  String get statisticsPeriodAll => 'All';

  @override
  String get statisticsSummaryTotalTime => 'Total time';

  @override
  String get statisticsSummarySessionsCount => 'Sessions';

  @override
  String get statisticsSummaryAverageSession => 'Average session';

  @override
  String get statisticsSummaryLongestSession => 'Longest session';

  @override
  String get loadingTitle => 'Loading...';

  @override
  String get errorTitle => 'Something went wrong';
}
