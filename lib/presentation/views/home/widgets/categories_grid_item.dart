import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/config/app_styles.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:flutter/material.dart';

class CategoriesGridItem extends StatelessWidget {
  final String image;
  final String title;
  const CategoriesGridItem(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBorderedContainer(
          height: 70,
          borderRadius: 8,
          borderColor: AppColors.inputBorderColor,
          borderWidth: 1,
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => CustomBorderedContainer(
                height: 70,
                borderColor: Colors.transparent,
                child: CircularProgressIndicator(color: AppColors.iconColor)),
          ),
        ),
        SizedBox(height: 10),
        FittedBox(
          child: Text(title, style: AppStyles.r10, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
