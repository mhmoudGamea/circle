import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';

class CustomHorizontalLatestProductsListItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CustomHorizontalLatestProductsListItem({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected
            ? AppColors.primaryColor
            : AppColors.navRailBackgroundColor,
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
