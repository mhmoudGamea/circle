import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/utils/helper.dart';
import '../../../data/models/home/categories/categories_model.dart';
import '../../../domain/repositories/base_category_repository.dart';
import '../../../injection.dart';
import '../../../main.dart';

mixin CategoryMixin on ChangeNotifier {
  final BaseCategoryRepository baseCategoryRepository =
      getIt<BaseCategoryRepository>();

  // method to get categories in home view and categories view
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
    final result = await baseCategoryRepository.getCategories();
    result.fold((fail) {
      _disposeCategories();
      // show error snackbar
      Helper.errorMessage(navigatorKey.currentContext!, message: fail.message);
      log('error in home provider getCategories ${fail.message}');
    }, (success) {
      _categoriesModelList = success;
      log('sucess in home provider getCategories ${_categoriesModelList.length}');
      _disposeCategories();
    });
  }
}
