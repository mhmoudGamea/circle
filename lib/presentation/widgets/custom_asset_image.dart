import 'package:circle/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  final String assetName;
  final double? radius;

  const CustomAssetImage({
    super.key,
    required this.assetName,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius?.r ?? 8.r),
        image: DecorationImage(
          image: AssetImage(
            assetName.startsWith('assets')
                ? assetName
                : 'assets/images/png/$assetName.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
