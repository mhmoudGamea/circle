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
    return Consumer<MainProvider>(
      builder: (_, provider, child) => Scaffold(
        appBar: CustomAppBar(
          showToolBar: true,
          title: provider.appBarTitle().tr(),
        ),
        body: IndexedStack(
          index: provider.currentIndex,
          children: provider.views,
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
