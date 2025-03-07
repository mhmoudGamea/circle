import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../main/main_provider.dart';
import '../mixins/category_mixin.dart';

class CategoryProvider with ChangeNotifier, CategoryMixin {
  /// Sets the selected grid item index and navigates to the ComponentView.
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  void changeGridItemIndex(int index) {
    _selectedIndex = index;
    // if statement to not allow the user to nav to component view if he is already at it
    if (navigatorKey.currentContext!.read<MainProvider>().currentIndex != 1) {
      navigatorKey.currentContext!.read<MainProvider>().changeIndex(1);
    }
    notifyListeners();
  }
}
