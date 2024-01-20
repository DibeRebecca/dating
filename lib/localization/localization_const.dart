import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalizations.of(context).getTranslateValues(key);
}

const String english = 'en';

const String french = 'fr';

const String hindi = 'hi';

const String indonesian = 'id';

const String chinese = 'zh';

const String arabic = 'ar';

const String languageKey = "languageCode";

Future<Locale> setLocales(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(languageKey, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale temp;
  switch (languageCode) {
    case english:
      temp = Locale(languageCode);
      break;
    case french:
      temp = Locale(languageCode);
      break;
    case hindi:
      temp = Locale(languageCode);
      break;
    case indonesian:
      temp = Locale(languageCode);
      break;
    case chinese:
      temp = Locale(languageCode);
      break;
    case arabic:
      temp = Locale(languageCode);
      break;
    default:
      temp = const Locale(french);
  }
  return temp;
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print("check");
  print(languageKey);
  print(prefs.getString(languageKey));
  String languageCode = prefs.getString(languageKey) ?? french;
  print("local to run");
  print(languageCode);
  return _locale(languageCode);
}
