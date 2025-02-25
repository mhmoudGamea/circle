import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCartLogo extends StatelessWidget {
  final Color lineColor;
  final Color cartColor;
  final double? cartWidth;
  final double? cartHeight;
  final double? lineWidth;
  final double? lineHeight;
  const CustomCartLogo({
    super.key,
    required this.lineColor,
    required this.cartColor,
    this.cartWidth,
    this.cartHeight,
    this.lineWidth,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 23,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => SvgPicture.asset(
                        'assets/images/svg/bg1.svg',
                        color: lineColor,
                        width: lineWidth,
                        height: lineHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/svg/cart_logo.svg',
                color: cartColor,
                width: cartWidth,
                height: cartHeight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
