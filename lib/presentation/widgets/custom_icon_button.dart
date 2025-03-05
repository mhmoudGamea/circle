import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/config/app_styles.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? backgroungColor;
  final Color? borderColor;
  final double borderRadius;
  final double width;
  final double height;
  final String title;
  final String icon;
  final bool isExpanded;
  final Color? titleColor;
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.title,
    required this.icon,
    this.titleColor,
    this.backgroungColor,
    this.borderColor,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomBorderedContainer(
        bg: backgroungColor ?? Colors.transparent,
        borderColor: borderColor ?? AppColors.primaryColor,
        borderRadius: borderRadius,
        width: width,
        height: height,
        isExpanded: isExpanded,
        padding: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomSvgIcon(assetName: icon),
            Text(
              title,
              style: AppStyles.b16.copyWith(
                color: titleColor ?? AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
