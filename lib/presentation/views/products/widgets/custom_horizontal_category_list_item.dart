import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';

class CustomHorizontalCategoryListItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CustomHorizontalCategoryListItem(
      {super.key, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
        ),
      ),
      child: FittedBox(child: Text(title)),
    );
  }
}
