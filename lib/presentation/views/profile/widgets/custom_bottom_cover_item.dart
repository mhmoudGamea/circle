import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

class CustomBottomCoverItem extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String title;
  const CustomBottomCoverItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CustomSvgIcon(assetName: icon, width: 22.w, height: 22.w),
            SizedBox(width: 10),
            Text(title, style: AppStyles.r16),
            Spacer(),
            Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
      ),
    );
  }
}
