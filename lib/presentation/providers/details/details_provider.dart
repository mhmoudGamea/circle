import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  /// increase and decrease Quantity in details view
  int _quantity = 1;
  int get quantity => _quantity;

  void increaseQuantity(num price) {
    _quantity++;
    getTotlaPrice(price: price);
    notifyListeners();
  }

  void decreaseQuantity(num price) {
    if (quantity > 1) {
      _quantity--;
      getTotlaPrice(price: price);
      notifyListeners();
    }
  }

  /// get totla price of the product in details view
  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  double getTotlaPrice({required num price}) {
    _totalPrice = price.toDouble() * _quantity;
    notifyListeners();
    return _totalPrice;
  }
}
