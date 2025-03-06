import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/utils/helper.dart';
import '../../../widgets/custom_bordered_container.dart';

class CustomVerticalListViewItem extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  const CustomVerticalListViewItem(
      {super.key,
      required this.image,
      required this.title,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: CustomBorderedContainer(
        borderColor: isSelected ? AppColors.primaryColor : Colors.transparent,
        isExpanded: true,
        borderRadius: 16,
        bg: isSelected
            ? AppColors.navRailBackgroundButtonColor
            : Colors.transparent,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => Helper.shimmerLoading(),
              ),
            ),
            SizedBox(height: 5),
            Text(title, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
