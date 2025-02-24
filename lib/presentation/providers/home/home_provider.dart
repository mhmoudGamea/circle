import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  //city drop down button
  final List<String> _cities = ['القاهره', 'المنوفيه'];

  List<String> get cities => _cities;

  // search ho
}
