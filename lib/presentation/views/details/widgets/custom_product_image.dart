import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/app_theme/app_colors.dart';

class CustomProductImage extends StatelessWidget {
  final String image;
  const CustomProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Skeletonizer(
        enabled: false,
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => const CircularProgressIndicator(
            color: AppColors.iconColor,
          ),
        ),
      ),
    );
  }
}
