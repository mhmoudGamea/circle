import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../widgets/custom_bordered_container.dart';
import 'custom_top_cover_item.dart';

class CustomTopCover extends StatelessWidget {
  const CustomTopCover({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
      bg: AppColors.coverColor,
      borderColor: Colors.transparent,
      isExpanded: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTopCoverItem(
            icon: 'my_orders',
            title: 'profile.myOrders'.tr(),
          ),
          CustomTopCoverItem(
            icon: 'favourite',
            title: 'profile.favorites'.tr(),
          ),
          CustomTopCoverItem(
            icon: 'points',
            title: 'profile.points'.tr(),
          ),
        ],
      ),
    );
  }
}
