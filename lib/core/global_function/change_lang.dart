// import '../constant/language/languages_constants.dart';
// import '../constant/shared_preferance/shared_preferance_keys.dart';
// import '../injection.dart';
// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// enum LangType { turkish, english }

// class ChangeLang {
//   LangType langType;
//   BuildContext context;
//   ChangeLang({required this.langType, required this.context}) {
//     SharedPreferences sharedPreferences = serviceLocator<SharedPreferences>();
//     if (langType == LangType.english) {
//       context.setLocale(LanguagesConstants.englishUsLocale);
//       sharedPreferences.setString(SharedPreferanceKeys.currentLang, LanguagesConstants.englishLanguageCode);
//     } else if (langType == LangType.turkish) {
//       context.setLocale(LanguagesConstants.turkishTurLocale);
//       sharedPreferences.setString(SharedPreferanceKeys.currentLang, LanguagesConstants.turishLanguageCode);
//     }
//   }
// }
