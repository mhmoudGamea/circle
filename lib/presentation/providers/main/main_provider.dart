import 'package:flutter/material.dart';

import '../../views/components/component_view.dart';
import '../../views/home/home_view.dart';
import '../../views/profile/profile_view.dart';

class MainProvider extends ChangeNotifier {
  // list of views that i have in bottom nav bar
  final List<Widget> _views = [
    HomeView(),
    ComponentView(),
    ProfileView(),
  ];

  List<Widget> get views => [..._views];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Sets the selected grid item index and navigates to the ComponentView.

  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;
  void setSelectedGridItemIndex(int index) {
    _selectedIndex = index;
    changeIndex(1);
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
}
