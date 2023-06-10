import 'dart:ui';

import 'package:get/get.dart';

import '../../translations/bn_bd.dart';
import '../../translations/en_us.dart';
import '../helper/shared_value_helper.dart';


class LocalizationService extends Translations {


  static const locale = Locale('en', 'US');
  static const fallbackLocal = Locale('bd', 'BD');

  static final language = ['en', 'bd'];
  static final locals = [
    const Locale('en', 'US'),
    const Locale('bd', 'BD'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'bd_BD': bd,
      };

  changeLocale(String lang) {
    final local = _getLanguageFromLanguage(lang);
    Get.updateLocale(local);
   /* appLanguage.$ = lang;
    appLanguage.save();*/
  }

  Locale _getLanguageFromLanguage(String lang) {
    for (int i = 0; i < language.length; i++) {
      if (lang == language[i]) {
        return locals[i];
      } else {}
    }
    return Get.locale!;
  }
}
