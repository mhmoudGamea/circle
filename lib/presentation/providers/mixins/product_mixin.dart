import 'dart:developer';

import 'package:circle/data/models/home/latest_products/product_model.dart';
import 'package:circle/domain/repositories/base_product_repository.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/helper.dart';
import '../../../injection.dart';
import '../../../main.dart';

mixin ProductMixin on ChangeNotifier {
  final BaseProductRepository baseProductRepository =
      getIt<BaseProductRepository>();

  // method to get latest products in home
  List<ProductModel> _latestProductsModelList = [];
  List<ProductModel> get latestProductsModelList =>
      [..._latestProductsModelList];

  Future<void> getLatestProducts() async {
    final result = await baseProductRepository.getLatestProducts();
    result.fold((fail) {
      // show error snackbar
      Helper.errorMessage(navigatorKey.currentContext!, message: fail.message);
      log('error in home provider getLatestProducts ${fail.message}');
    }, (success) {
      _latestProductsModelList = success;
      notifyListeners();
      log('sucess in home provider getLatestProducts ${_latestProductsModelList.length}');
    });
  }

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => [..._productList];

  Future<void> getProduct(
      {String? title, String? categoryId, String? subCategoryId}) async {
    final result = await baseProductRepository.getProduct(
        title: title, categoryId: categoryId, subCategoryId: subCategoryId);
    result.fold((fail) {
      // show error snackbar
      Helper.errorMessage(navigatorKey.currentContext!, message: fail.message);
      log('error in home provider getLatestProducts ${fail.message}');
    }, (success) {
      _productList = success;
      notifyListeners();
      log('sucess in home provider getLatestProducts ${_productList.length}');
    });
  }
}
