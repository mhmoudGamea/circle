import 'dart:developer';

import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/helper.dart';
import '../../../data/models/home/categories/categories_model.dart';
import '../../../data/repositories/components_repository.dart';
import '../../../main.dart';

class ComponentProvider extends ChangeNotifier {
  final ComponentsRepository componentsRepository;

  ComponentProvider(this.componentsRepository);

  // Sets the selected grid item index and navigates to the ComponentView.

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  void changeGridItemIndex(int index) {
    print('i am here in component provider');
    _selectedIndex = index;
    // if statement to not allow the user to nav to component view if he is already at it
    if (navigatorKey.currentContext!.read<MainProvider>().currentIndex != 1) {
      navigatorKey.currentContext!.read<MainProvider>().changeIndex(1);
    }
    notifyListeners();
  }

  // method to get categories in home
  List<CategoriesModel> _categoriesModelList = [];
  List<CategoriesModel> get categoriesModelList => [..._categoriesModelList];

  bool _isLoadingCategory = false;
  bool get isLoadingCategory => _isLoadingCategory;

  void _disposeCategories() {
    _isLoadingCategory = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    _isLoadingCategory = true;
    notifyListeners();
    final result = await componentsRepository.getCategories();
    result.fold((fail) {
      _disposeCategories();
      // show error snackbar
      Helper.errorMessage(navigatorKey.currentContext!, message: fail.message);
      log('error in component provider getCategories ${fail.message}');
    }, (success) {
      _categoriesModelList = success;
      log('sucess in component provider getCategories ${_categoriesModelList.length}');
      _disposeCategories();
    });
  }
}
