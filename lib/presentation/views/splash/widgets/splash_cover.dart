import 'package:circle/core/services/responsive_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';

class SplashCover extends StatelessWidget {
  const SplashCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) => Container(
          width: ResponsiveService.fullScreenWidth(ratio: 1 / 3.1),
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(60),
              bottomLeft: Radius.circular(60),
            ),
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
