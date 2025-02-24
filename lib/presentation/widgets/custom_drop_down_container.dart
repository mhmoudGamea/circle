import 'package:flutter/material.dart';

import '../../core/app_theme/app_colors.dart';
import '../../core/constants/constants.dart';

class CustomDropDownContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget dropDown;
  final Color backgroundColor;
  final bool enableBorder;
  const CustomDropDownContainer({
    super.key,
    required this.dropDown,
    this.backgroundColor = AppColors.white,
    this.enableBorder = false,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 60,
      padding: EdgeInsets.symmetric(horizontal: Constants.border),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: enableBorder
            ? Border.all(width: 1.5, color: AppColors.inputBorderColor)
            : null,
      ),
      child: dropDown,
    );
  }
}
