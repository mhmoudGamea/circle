import 'dart:developer';

import 'package:circle/data/models/home/categories/categories_model.dart';
import 'package:circle/data/models/home/latest_products/latest_products_model.dart';
import 'package:circle/data/repositories/home_repository.dart';
import 'package:circle/main.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/helper.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository homeRepositories;
  HomeProvider(this.homeRepositories);
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
    final result = await homeRepositories.getCategories();
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

  // method to get latest products in home
  List<LatestProductsModel> _latestProductsModelList = [];
  List<LatestProductsModel> get latestProductsModelList =>
      [..._latestProductsModelList];

  bool _isLoadingLatestProducts = false;
  bool get isLoadingLatestProducts => _isLoadingLatestProducts;

  void _disposeLatestProducts() {
    _isLoadingLatestProducts = false;
    notifyListeners();
  }

  Future<void> getLatestProducts() async {
    _isLoadingLatestProducts = true;
    log(_isLoadingLatestProducts.toString());
    notifyListeners();
    final result = await homeRepositories.getLatestProducts();
    result.fold((fail) {
      _disposeLatestProducts();
      // show error snackbar
      Helper.errorMessage(navigatorKey.currentContext!, message: fail.message);
      log('error in home provider getLatestProducts ${fail.message}');
    }, (success) {
      _latestProductsModelList = success;
      log('sucess in home provider getLatestProducts ${_latestProductsModelList.length}');
      _disposeLatestProducts();
      log(_isLoadingLatestProducts.toString());
    });
  }
}
