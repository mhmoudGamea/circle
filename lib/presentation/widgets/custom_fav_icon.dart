import 'package:flutter/material.dart';

import '../../core/app_theme/app_colors.dart';

class CustomFavIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Color? bg;
  final Color? iconColor;
  const CustomFavIcon(
      {super.key, required this.onTap, this.bg, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: bg ?? AppColors.inputBackground,
        child: Icon(Icons.favorite, color: iconColor ?? AppColors.favIconColor),
      ),
    );
  }
}
