import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main/main_provider.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    log('should be at home');
    return Consumer<MainProvider>(
      builder: (_, provider, child) => Scaffold(
        appBar: provider.currentIndex == 0
            ? null
            : CustomAppBar(
                showToolBar: true,
                title: provider.appBarTitle().tr(),
                showBackArrow: false,
              ),
        body: WillPopScope(
          onWillPop: () {
            if (provider.currentIndex == 1 || provider.currentIndex == 2) {
              log(provider.currentIndex.toString());
              provider.changeIndex(0);
              log('must pop');
              log(provider.currentIndex.toString());
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: SafeArea(
            child: IndexedStack(
              index: provider.currentIndex,
              children: provider.views,
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
