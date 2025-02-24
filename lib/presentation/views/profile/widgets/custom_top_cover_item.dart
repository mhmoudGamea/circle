import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

class CustomTopCoverItem extends StatelessWidget {
  final String icon;
  final String title;
  const CustomTopCoverItem(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        CustomSvgIcon(assetName: icon, width: 35.w, height: 35.w),
        Text(title, style: AppStyles.b16),
      ],
    );
  }
}
