import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle/core/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';

class CustomHorizontalCategoryListItem extends StatelessWidget {
  final String? image;
  final String title;
  final bool isSelected;
  const CustomHorizontalCategoryListItem(
      {super.key, this.image, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
        ),
      ),
      child: Row(
        spacing: 10,
        children: [
          if (image != null)
            CachedNetworkImage(
              imageUrl: image!,
              placeholder: (context, url) => Helper.shimmerLoading(),
            ),
          Text(title),
        ],
      ),
    );
  }
}
