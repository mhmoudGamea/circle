import 'package:flutter/material.dart';
import '../mixins/category_mixin.dart';
import '../mixins/product_mixin.dart';

class HomeProvider with ChangeNotifier, CategoryMixin, ProductMixin {
  // city drop down menu
  static final List<String> _cities = [
    'dropDownCity.city0',
    'dropDownCity.city1',
    'dropDownCity.city2'
  ];

  List<String> get cities => [..._cities];

  String _newCity = _cities.first;
  String get newCity => _newCity;

  void changeCity(String city) {
    _newCity = city;
    notifyListeners();
  }

  // carousel slider images
  final List<String> _images = [
    'carousal0',
    'carousal1',
    'carousal2',
  ];
  List<String> get images => _images;
}
