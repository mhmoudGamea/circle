import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  // select item from category
  int _selectedCategoryIndex = -1;
  int get selectedCategoryIndex => _selectedCategoryIndex;

  void setSelectedCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  // select item from latest products
  int _selectedLatestProductIndex = -1;
  int get selectedLatestProductIndex => _selectedLatestProductIndex;

  void setSelectedLatestProductIndex(int index) {
    _selectedLatestProductIndex = index;
    notifyListeners();
  }
}
