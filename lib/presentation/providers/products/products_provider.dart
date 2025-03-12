import 'dart:developer';

import 'package:circle/data/models/home/categories/categories_model.dart';
import 'package:flutter/material.dart';

import '../mixins/category_mixin.dart';
import '../mixins/latest_product_mixin.dart';

class ProductsProvider with ChangeNotifier, CategoryMixin, LatestProductMixin {
  // select item from category
  int _selectedCategoryIndex = -1;
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
  List<CategoriesModel> getSubCategories() {
    // i use Future.microtask because i want to make sure that the widgets tree is builted first
    // and then i can call notifyListeners
    Future.microtask(() {
      _selectedCategoryIndex = -1;
      notifyListeners();
    });
    List<CategoriesModel> subCategories = [];
    if (categoriesModelList.isEmpty) {
      log('still empty');
      return CategoriesModel.dummySubCategory();
    }
    for (int i = 0; i < categoriesModelList.length; i++) {
      for (int j = 0; j < categoriesModelList[i].subCategories!.length; j++) {
        subCategories.add(categoriesModelList[i].subCategories![j]);
      }
    }
    return subCategories;
  }

  /// method to return either getSubCategories() method or subCategories from categoriesModelList list
  /// based on the value of _selectedCategoryIndex
  List<CategoriesModel> getSelectedSubCategories() {
    return _selectedCategoryIndex == -1
        ? getSubCategories()
        : categoriesModelList[_selectedCategoryIndex].subCategories!;
  }
}
