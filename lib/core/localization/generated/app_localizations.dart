import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Spend Time'**
  String get appTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeTitle;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get welcomeMessage;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Spend Time'**
  String get homeTitle;

  /// No description provided for @noTopicsTitle.
  ///
  /// In en, this message translates to:
  /// **'No topics yet'**
  String get noTopicsTitle;

  /// No description provided for @noTopicsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your first topic'**
  String get noTopicsSubtitle;

  /// No description provided for @createTopic.
  ///
  /// In en, this message translates to:
  /// **'Create topic'**
  String get createTopic;

  /// No description provided for @navigationTopics.
  ///
  /// In en, this message translates to:
  /// **'Topics'**
  String get navigationTopics;

  /// No description provided for @navigationStatistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get navigationStatistics;

  /// No description provided for @navigationSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navigationSettings;

  /// No description provided for @createTopicTitle.
  ///
  /// In en, this message translates to:
  /// **'New topic'**
  String get createTopicTitle;

  /// No description provided for @topicNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Topic name'**
  String get topicNameLabel;

  /// No description provided for @topicNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter topic name'**
  String get topicNameHint;

  /// No description provided for @topicIconSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get topicIconSectionTitle;

  /// No description provided for @topicColorSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get topicColorSectionTitle;

  /// No description provided for @closeButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButtonTooltip;

  /// No description provided for @createButton.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createButton;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @todayLabel.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayLabel;

  /// No description provided for @totalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalLabel;

  /// No description provided for @startButton.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startButton;

  /// No description provided for @stopButton.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stopButton;

  /// No description provided for @noSessionHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'No sessions yet'**
  String get noSessionHistoryTitle;

  /// No description provided for @noSessionHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Completed sessions will appear here'**
  String get noSessionHistorySubtitle;

  /// No description provided for @deleteTopicTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete topic?'**
  String get deleteTopicTitle;

  /// No description provided for @deleteTopicMessage.
  ///
  /// In en, this message translates to:
  /// **'This will delete \"{topicName}\" and all of its session history.'**
  String deleteTopicMessage(String topicName);

  /// No description provided for @deleteTopicConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteTopicConfirmButton;

  /// No description provided for @deleteTopicMenuItem.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteTopicMenuItem;

  /// No description provided for @deleteActiveTopicMessage.
  ///
  /// In en, this message translates to:
  /// **'Stop the active session before deleting this topic.'**
  String get deleteActiveTopicMessage;

  /// No description provided for @editTopicTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit topic'**
  String get editTopicTitle;

  /// No description provided for @editTopicNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Topic name'**
  String get editTopicNameLabel;

  /// No description provided for @editTopicSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editTopicSaveButton;

  /// No description provided for @editTopicMenuItem.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editTopicMenuItem;

  /// No description provided for @emptyTopicNameMessage.
  ///
  /// In en, this message translates to:
  /// **'Topic name cannot be empty.'**
  String get emptyTopicNameMessage;

  /// No description provided for @createTopicErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not create topic.'**
  String get createTopicErrorMessage;

  /// No description provided for @updateTopicErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not update topic.'**
  String get updateTopicErrorMessage;

  /// No description provided for @themeModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeModeLight;

  /// No description provided for @themeModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeModeDark;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRussian;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @appearanceSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceSectionTitle;

  /// No description provided for @languageSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSectionTitle;

  /// No description provided for @aboutSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutSectionTitle;

  /// No description provided for @aboutAppTitle.
  ///
  /// In en, this message translates to:
  /// **'About Spend Time'**
  String get aboutAppTitle;

  /// No description provided for @aboutAppDescription.
  ///
  /// In en, this message translates to:
  /// **'A simple local time tracker for your topics.'**
  String get aboutAppDescription;

  /// No description provided for @aboutLocalDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Your data is stored only on this device.'**
  String get aboutLocalDataDescription;

  /// No description provided for @appVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version {version} ({buildNumber})'**
  String appVersionLabel(String version, String buildNumber);

  /// No description provided for @updateThemeErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not update theme.'**
  String get updateThemeErrorMessage;

  /// No description provided for @updateLanguageErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not change the language. Please try again.'**
  String get updateLanguageErrorMessage;

  /// No description provided for @noStatisticsDistributionTitle.
  ///
  /// In en, this message translates to:
  /// **'No distribution yet'**
  String get noStatisticsDistributionTitle;

  /// No description provided for @noStatisticsDistributionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Completed sessions will appear here.'**
  String get noStatisticsDistributionSubtitle;

  /// No description provided for @statisticsPeriodToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get statisticsPeriodToday;

  /// No description provided for @statisticsPeriodWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get statisticsPeriodWeek;

  /// No description provided for @statisticsPeriodMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get statisticsPeriodMonth;

  /// No description provided for @statisticsPeriodYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get statisticsPeriodYear;

  /// No description provided for @statisticsPeriodAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get statisticsPeriodAll;

  /// No description provided for @statisticsSummaryTotalTime.
  ///
  /// In en, this message translates to:
  /// **'Total time'**
  String get statisticsSummaryTotalTime;

  /// No description provided for @statisticsSummarySessionsCount.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get statisticsSummarySessionsCount;

  /// No description provided for @statisticsSummaryAverageSession.
  ///
  /// In en, this message translates to:
  /// **'Average session'**
  String get statisticsSummaryAverageSession;

  /// No description provided for @statisticsSummaryLongestSession.
  ///
  /// In en, this message translates to:
  /// **'Longest session'**
  String get statisticsSummaryLongestSession;

  /// No description provided for @loadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingTitle;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
