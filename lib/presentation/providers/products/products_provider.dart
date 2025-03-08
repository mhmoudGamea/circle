import 'dart:developer';

import 'package:flutter/material.dart';

import '../mixins/category_mixin.dart';
import '../mixins/latest_product_mixin.dart';

class ProductsProvider with ChangeNotifier, CategoryMixin, LatestProductMixin {
  // select item from category
  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;

  void setSelectedCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  // select item from sub category
  int _selectedSubCategoryIndex = -1;
  int get selectedSubCategoryIndex => _selectedSubCategoryIndex;

  void setSelectedLatestProductIndex(int index) {
    _selectedSubCategoryIndex = index;
    notifyListeners();
  }

  /// method to get all subcategories and put them into one list
  List<String> getSubCategories() {
    List<String> subCategories = [];
    if (categoriesModelList.isEmpty) {
      log('still empty');
      return subCategories;
    }
    for (int i = 0; i < categoriesModelList.length; i++) {
      for (int j = 0; j < categoriesModelList[i].subCategories!.length; j++) {
        subCategories.add(categoriesModelList[i].subCategories![j].title!);
      }
    }
    log(subCategories.toString());
    return subCategories;
  }
}
