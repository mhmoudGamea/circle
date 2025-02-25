import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/presentation/views/home/widgets/padge_number.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

class HomeAppBarActionIcon extends StatelessWidget {
  final String iconName;
  final String? number;
  final VoidCallback onTap;
  const HomeAppBarActionIcon(
      {super.key, required this.iconName, this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          CustomBorderedContainer(
            width: 50,
            height: 50,
            bg: AppColors.iconColor,
            borderRadius: 16,
            child: CustomSvgIcon(assetName: iconName, width: 20, height: 20),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: PadgeNumber(number: number ?? ''),
          )
        ],
      ),
    );
  }
}
