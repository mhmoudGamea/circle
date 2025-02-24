import 'package:circle/presentation/views/components/component_view.dart';
import 'package:circle/presentation/views/home/home_view.dart';
import 'package:circle/presentation/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  final List<Widget> _views = [
    HomeView(),
    ComponentView(),
    ProfileView(),
  ];

  List<Widget> get views => [..._views];

  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // return appBarTitle based on current index
  String appBarTitle() {
    if (currentIndex == 0) {
      return 'home.appBarTitle';
    } else if (_currentIndex == 1) {
      return 'component.appBarTitle';
    } else {
      return 'profile.appBarTitle';
    }
  }
}
