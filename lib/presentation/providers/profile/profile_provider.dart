import 'dart:io';

import 'package:circle/core/services/image_picker_service.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/navigator/navigator.dart';

class ProfileProvider extends ImagePickerService with ChangeNotifier {
  // image picker
  final ImagePicker _picker = ImagePicker();

  File? _pickedImage;

  @override
  File? get pickedImage => _pickedImage;

  @override
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _pickedImage = File(image.path);
      notifyListeners();
    }
  }

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
