import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/services/prefs.dart';
import '../../views/categories/category_view.dart';
import '../../views/home/home_view.dart';
import '../../views/profile/profile_view.dart';

class MainProvider extends ChangeNotifier {
  // list of views that i have in bottom nav bar
  final List<Widget> _views = [
    HomeView(),
    CategoryView(),
    ProfileView(),
  ];

  List<Widget> get views => [..._views];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }

  // return appBarTitle based on current index
  String appBarTitle() {
    if (currentIndex == 0) {
      return 'home.appBar.welcome';
    } else if (_currentIndex == 1) {
      return 'Categories.appBarTitle';
    } else {
      return 'profile.appBarTitle';
    }
  }

  /// method to save user data to shared prefs
  Future<void> saveAtSharedPrefs(
      {required String firstName,
      required String lastName,
      String? image}) async {
    await Prefs.set(Constants.image, image ?? '');
    await Prefs.set(Constants.firstName, firstName);
    await Prefs.set(Constants.lastName, lastName);
    image = image ?? '';
    firstName = firstName;
    lastName = lastName;
    notifyListeners();
  }

  /// method to load user data from shared prefs
  String image = '';
  String firstName = '';
  String lastName = '';
  void loadUserData() {
    image = Prefs.get(Constants.image) ?? '';
    firstName = Prefs.get(Constants.firstName) ?? '';
    lastName = Prefs.get(Constants.lastName) ?? '';
    log('called loadUserData *********************first = $firstName *******************last = $lastName ****************************************************');

    notifyListeners();
  }
}
