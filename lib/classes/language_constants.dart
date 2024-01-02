import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String CHINESE = 'zh';
const String MALAY = 'bm';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH);
    case CHINESE:
      return const Locale(CHINESE);
    case MALAY:
      return const Locale(MALAY);
    default:
      return const Locale(ENGLISH);
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
