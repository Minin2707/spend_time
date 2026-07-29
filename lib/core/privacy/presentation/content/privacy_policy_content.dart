class PrivacyPolicyContent {
  const PrivacyPolicyContent({
    required this.lastUpdated,
    required this.contactEmail,
    required this.sections,
  });

  final String lastUpdated;
  final String contactEmail;
  final List<PrivacyPolicySection> sections;
}

class PrivacyPolicySection {
  const PrivacyPolicySection({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
}

abstract final class PrivacyPolicyContentSource {
  static PrivacyPolicyContent forLanguageCode(
    String languageCode,
  ) {
    return switch (languageCode) {
      'ru' => _ru,
      _ => _en,
    };
  }

  static const String _contactEmail = 'belavskijgeorgij9@gmail.com';

  static const PrivacyPolicyContent _en = PrivacyPolicyContent(
    lastUpdated: 'July 29, 2026',
    contactEmail: _contactEmail,
    sections: [
      PrivacyPolicySection(
        title: 'Information we store',
        body:
            'Spend Time can store the name or nickname you enter, your topics, '
            'selected topic icons and colors, session start and end times, and '
            'your language and theme settings. This data is stored locally so '
            'the app can show your topics, history, and statistics.',
      ),
      PrivacyPolicySection(
        title: 'How we use data',
        body:
            'The app uses locally stored data only to provide its core features '
            'and calculate time statistics. Spend Time does not use your data '
            'for analytics, advertising, tracking, or remote account features.',
      ),
      PrivacyPolicySection(
        title: 'Local storage',
        body:
            'Your data is stored in a SQLite database on your device. Spend Time '
            'does not provide cloud sync and does not upload this data to a '
            'remote server.',
      ),
      PrivacyPolicySection(
        title: 'Data sharing',
        body:
            'Spend Time does not automatically transfer your stored data outside '
            'your device. The app does not include analytics services, ads, or a '
            'server that receives your app data.',
      ),
      PrivacyPolicySection(
        title: 'Feedback',
        body:
            'When you choose Feedback, Spend Time opens an external email app '
            'with a draft message. The app version and build number may be added '
            'to the draft automatically, and the email is sent only after your '
            'explicit action in the email app.',
      ),
      PrivacyPolicySection(
        title: 'Data deletion',
        body:
            'You can delete individual topics in Spend Time, and deleting a '
            'topic also deletes its related sessions. There is currently no '
            'separate in-app action to delete all stored data at once, but app '
            'data can be removed by deleting the app from the device.',
      ),
      PrivacyPolicySection(
        title: 'Changes',
        body:
            'This policy may change as Spend Time develops. If features such as '
            'sync, analytics, advertising, or other data transfer are added, the '
            'policy should be updated before those changes are released.',
      ),
      PrivacyPolicySection(
        title: 'Contact',
        body:
            'If you have questions about this policy, contact the developer at '
            '$_contactEmail. Please include only information you are comfortable '
            'sharing.',
      ),
    ],
  );

  static const PrivacyPolicyContent _ru = PrivacyPolicyContent(
    lastUpdated: '29 июля 2026 года',
    contactEmail: _contactEmail,
    sections: [
      PrivacyPolicySection(
        title: 'Какие данные мы храним',
        body:
            'Spend Time может хранить введённое вами имя или псевдоним, темы, '
            'выбранные иконки и цвета тем, время начала и окончания сессий, а '
            'также настройки языка и оформления. Эти данные сохраняются '
            'локально, чтобы приложение могло показывать темы, историю и '
            'статистику.',
      ),
      PrivacyPolicySection(
        title: 'Как мы используем данные',
        body:
            'Приложение использует локально сохранённые данные только для своих '
            'основных функций и расчёта статистики времени. Spend Time не '
            'использует ваши данные для аналитики, рекламы, отслеживания или '
            'удалённой учётной записи.',
      ),
      PrivacyPolicySection(
        title: 'Локальное хранение',
        body:
            'Ваши данные хранятся в SQLite базе данных на устройстве. Spend Time '
            'не поддерживает облачную синхронизацию и не загружает эти данные на '
            'удалённый сервер.',
      ),
      PrivacyPolicySection(
        title: 'Передача данных',
        body:
            'Spend Time не передаёт сохранённые данные за пределы устройства '
            'автоматически. В приложении нет аналитических сервисов, рекламы или '
            'сервера, который получает данные приложения.',
      ),
      PrivacyPolicySection(
        title: 'Обратная связь',
        body:
            'Когда вы выбираете обратную связь, Spend Time открывает внешнее '
            'почтовое приложение с черновиком письма. Версия приложения и номер '
            'сборки могут добавляться в черновик автоматически, а письмо '
            'отправляется только после вашего явного действия в почтовом '
            'приложении.',
      ),
      PrivacyPolicySection(
        title: 'Удаление данных',
        body:
            'Вы можете удалять отдельные темы в Spend Time, и удаление темы '
            'также удаляет связанные с ней сессии. Сейчас в приложении нет '
            'отдельного действия для удаления всех сохранённых данных сразу, но '
            'данные приложения можно удалить, удалив приложение с устройства.',
      ),
      PrivacyPolicySection(
        title: 'Изменения политики',
        body:
            'Эта политика может изменяться по мере развития Spend Time. Если в '
            'будущем появятся синхронизация, аналитика, реклама или другая '
            'передача данных, политика должна быть обновлена до выпуска таких '
            'изменений.',
      ),
      PrivacyPolicySection(
        title: 'Контакты',
        body:
            'Если у вас есть вопросы об этой политике, свяжитесь с разработчиком '
            'по адресу $_contactEmail. Указывайте только ту информацию, которой '
            'готовы поделиться.',
      ),
    ],
  );
}
