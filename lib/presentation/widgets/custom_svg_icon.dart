import 'package:circle/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  const CustomSvgIcon(
      {super.key,
      required this.assetName,
      this.width,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svg/$assetName.svg',
      fit: BoxFit.scaleDown,
      width: width ?? 20.w,
      height: height ?? 20.w,
      color: color,
    );
  }
}
