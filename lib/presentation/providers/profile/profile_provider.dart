import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/navigator/navigator.dart';
import '../mixins/pick_image_mixin.dart';

class ProfileProvider with ChangeNotifier, PickImageMixin {
  // change app language bottom modal sheet
  // 0 for arabic, 1 for english
  int _currentIndex = -1;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool _languageChanged = false;

  bool get languageChanged => _languageChanged;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> changeLanguage(BuildContext context) async {
    Locale newLocale = navigatorKey.currentContext!.locale;
    _languageChanged =
        false; // i had to reset the value to false to make the selector work
    _isLoading = true;
    notifyListeners();
    if (_currentIndex == 0) {
      if (navigatorKey.currentContext!.locale.languageCode == 'en') {
        newLocale = Locale('ar');
      }
    } else {
      if (navigatorKey.currentContext!.locale.languageCode == 'ar') {
        newLocale = Locale('en');
      }
    }
    if (navigatorKey.currentContext!.locale != newLocale) {
      await navigatorKey.currentContext!.setLocale(newLocale);
      _languageChanged = true;
      resetValues();
      // is that right to show snackbar here? or should i show it in the view?
      //TODO: show snackbar indicate that the language is changed successfully
    } else {
      resetValues();
      //TODO: show snackbar indicate that the language is already selected
    }
  }

  void resetValues() {
    _isLoading = false;
    notifyListeners();
    NavigatorHandler.pop();
  }
}
