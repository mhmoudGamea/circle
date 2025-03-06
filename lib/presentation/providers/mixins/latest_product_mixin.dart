import 'dart:developer';

import 'package:circle/injection.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/helper.dart';
import '../../../data/models/home/latest_products/latest_products_model.dart';
import '../../../domain/repositories/base_latest_products_repository.dart';
import '../../../main.dart';

mixin LatestProductMixin on ChangeNotifier {
  final BaseLatestProductsRepository baseLatestProductsRepository =
      getIt<BaseLatestProductsRepository>();

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
    final result = await baseLatestProductsRepository.getLatestProducts();
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
