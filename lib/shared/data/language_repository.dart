import 'package:shared_preferences/shared_preferences.dart';

class LanguageRepository {
  static const String _languageKey = 'selected_language';
  final SharedPreferences _prefs;

  LanguageRepository(this._prefs);

  Future<String> getLanguage() async {
    return _prefs.getString(_languageKey) ?? 'en-us';
  }

  Future<void> setLanguage(String languageCode) async {
    await _prefs.setString(_languageKey, languageCode);
  }
}
