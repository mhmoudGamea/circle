import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCartLogo extends StatelessWidget {
  final Color lineColor;
  final Color cartColor;
  const CustomCartLogo(
      {super.key, required this.lineColor, required this.cartColor});

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
                      (index) => SvgPicture.asset('assets/images/svg/bg1.svg',
                          color: lineColor),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/svg/cart_logo.svg',
                  color: cartColor),
            ),
          ],
        ),
      ],
    );
  }
}
