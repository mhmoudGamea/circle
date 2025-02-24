import 'dart:io';

import 'package:circle/core/services/image_picker_service.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  void changeLanguage(BuildContext context) {
    //TODO: implement snackbar for user to indicate that the language has been successfully changed
    if (_currentIndex == 0) {
      if (navigatorKey.currentContext!.locale.languageCode == 'en') {
        navigatorKey.currentContext!.setLocale(Locale('ar'));
      } else {
        navigatorKey.currentContext!.setLocale(Locale('en'));
      }
    } else {
      if (navigatorKey.currentContext!.locale.languageCode == 'ar') {
        navigatorKey.currentContext!.setLocale(Locale('en'));
      } else {
        navigatorKey.currentContext!.setLocale(Locale('ar'));
      }
    }
  }
}
