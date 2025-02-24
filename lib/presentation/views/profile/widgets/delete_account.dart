import 'package:circle/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/app_styles.dart';
import '../../../widgets/custom_svg_icon.dart';

class DeleteAccount extends StatelessWidget {
  final String icon;
  final String title;
  const DeleteAccount({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Row(
        children: [
          CustomSvgIcon(assetName: icon, width: 22.w, height: 22.w),
          SizedBox(width: 10),
          Text(title, style: AppStyles.r16.copyWith(color: Colors.red)),
        ],
      ),
    );
  }
}
