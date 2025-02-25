import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/config/app_styles.dart';

class PadgeNumber extends StatelessWidget {
  final String number;
  const PadgeNumber({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
        border: Border.all(color: AppColors.white, width: 1),
      ),
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: AppStyles.r10.copyWith(color: AppColors.white),
      ),
    );
  }
}
