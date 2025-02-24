import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (_, provider, child) => BottomNavigationBar(
        currentIndex: provider.currentIndex,
        backgroundColor: AppColors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: provider.currentIndex == 0
                ? CustomSvgIcon(assetName: 'home_active', width: 20.w)
                : CustomSvgIcon(assetName: 'home_non_active', width: 20.w),
            label: 'home.title'.tr(),
          ),
          BottomNavigationBarItem(
            icon: provider.currentIndex == 1
                ? CustomSvgIcon(assetName: 'component_active', width: 20.w)
                : CustomSvgIcon(assetName: 'component_non_active', width: 20.w),
            label: 'components.title'.tr(),
          ),
          BottomNavigationBarItem(
            icon: provider.currentIndex == 2
                ? CustomSvgIcon(assetName: 'setting_active', width: 20.w)
                : CustomSvgIcon(assetName: 'setting_non_active', width: 20.w),
            label: 'profile.appBarTitle'.tr(),
          ),
        ],
        onTap: (index) {
          provider.changeIndex(index);
        },
      ),
    );
  }
}
