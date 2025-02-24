import 'package:circle/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/dimens/dimens.dart';
import '../../core/app_theme/app_colors.dart';

class CustomBorderedContainer extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Color? bg;
  final double? width;
  final double? height;
  final double? padding;
  final bool isExpanded;
  const CustomBorderedContainer(
      {super.key,
      required this.child,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      this.bg,
      this.width,
      this.height,
      this.padding,
      this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Dimens.width,
      height: isExpanded ? null : height ?? 56.h,
      alignment: Alignment.center,
      padding: EdgeInsets.all(padding ?? 12.h),
      decoration: BoxDecoration(
        color: bg ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        border: Border.all(
          color: borderColor ?? AppColors.inputBorderColor,
          width: borderWidth ?? 1,
        ),
      ),
      child: child,
    );
  }
}
