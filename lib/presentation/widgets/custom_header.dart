import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String leading;
  final String trailing;
  final VoidCallback trailingOnTap;
  const CustomHeader(
      {super.key,
      required this.leading,
      required this.trailing,
      required this.trailingOnTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leading,
          style: AppStyles.b18,
        ),
        Spacer(),
        Row(
          spacing: 3,
          children: [
            Text(
              trailing,
              style: AppStyles.r12.copyWith(color: AppColors.primaryColor),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: AppColors.primaryColor,
            ),
          ],
        ).onTap(trailingOnTap),
      ],
    );
  }
}
