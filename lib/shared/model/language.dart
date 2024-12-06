class Language {
  final String code;
  final String name;

  const Language({
    required this.code,
    required this.name,
  });

  static const List<Language> supportedLanguages = [
    // Language(code: 'de-de', name: 'Deutsch'),
    Language(code: 'en-gb', name: 'English (UK)'),
    Language(code: 'en-us', name: 'English (US)'),
    // Language(code: 'es-es', name: 'Español (España)'),
    // Language(code: 'es-mx', name: 'Español (México)'),
    // Language(code: 'fr-fr', name: 'Français'),
    // Language(code: 'it-it', name: 'Italiano'),
    Language(code: 'ja-jp', name: '日本語'),
    Language(code: 'ko-kr', name: '한국어'),
    // Language(code: 'pl-pl', name: 'Polski'),
    // Language(code: 'pt-br', name: 'Português (Brasil)'),
    // Language(code: 'ru-ru', name: 'Русский'),
    // Language(code: 'zh-tw', name: '繁體中文'),
  ];
}
