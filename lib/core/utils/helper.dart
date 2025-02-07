import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class Helper {
  Helper._();

  static changeLanguage({required BuildContext context}) {
    if (context.locale.languageCode == 'en') {
      context.setLocale(Locale('ar'));
    } else {
      context.setLocale(Locale('en'));
    }
  }
}
