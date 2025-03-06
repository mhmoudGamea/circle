import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/providers/mixins/category_mixin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/category_repository.dart';
import '../../../main.dart';

class CategoryProvider with ChangeNotifier, CategoryMixin {
  final CategoriesRepository categoryRepository;

  CategoryProvider(this.categoryRepository);

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
