// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Spend Time';

  @override
  String get welcomeTitle => 'Добро пожаловать';

  @override
  String get welcomeMessage => 'Как к вам обращаться?';

  @override
  String get nameLabel => 'Имя';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get homeTitle => 'Spend Time';

  @override
  String get noTopicsTitle => 'Тем пока нет';

  @override
  String get noTopicsSubtitle => 'Создайте первую тему';

  @override
  String get createTopic => 'Создать тему';

  @override
  String get createTopicTitle => 'Новая тема';

  @override
  String get topicNameLabel => 'Название темы';

  @override
  String get createButton => 'Создать';

  @override
  String get cancelButton => 'Отмена';

  @override
  String get todayLabel => 'Сегодня';

  @override
  String get totalLabel => 'Всего';

  @override
  String get startButton => 'Начать';

  @override
  String get stopButton => 'Остановить';

  @override
  String get noSessionHistoryTitle => 'Истории пока нет';

  @override
  String get noSessionHistorySubtitle => 'Завершённые сессии появятся здесь';

  @override
  String get deleteTopicTitle => 'Удалить тему?';

  @override
  String deleteTopicMessage(String topicName) {
    return 'Тема «$topicName» и вся её история сессий будут удалены.';
  }

  @override
  String get deleteTopicConfirmButton => 'Удалить';

  @override
  String get deleteTopicMenuItem => 'Удалить';

  @override
  String get deleteActiveTopicMessage =>
      'Сначала остановите активную сессию, затем удалите тему.';

  @override
  String get editTopicTitle => 'Редактировать тему';

  @override
  String get editTopicNameLabel => 'Название темы';

  @override
  String get editTopicSaveButton => 'Сохранить';

  @override
  String get editTopicMenuItem => 'Редактировать';

  @override
  String get emptyTopicNameMessage => 'Название темы не может быть пустым.';

  @override
  String get updateTopicErrorMessage => 'Не удалось обновить тему.';

  @override
  String get themeModeLight => 'Светлая';

  @override
  String get themeModeDark => 'Тёмная';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get appearanceSectionTitle => 'Внешний вид';

  @override
  String get updateThemeErrorMessage => 'Не удалось обновить тему оформления.';

  @override
  String get noStatisticsDistributionTitle => 'Распределения пока нет';

  @override
  String get noStatisticsDistributionSubtitle =>
      'Завершённые сессии появятся здесь.';

  @override
  String get loadingTitle => 'Загрузка...';

  @override
  String get errorTitle => 'Что-то пошло не так';
}
