import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCartLogo extends StatelessWidget {
  final Color color;
  const CustomCartLogo({super.key, required this.color});

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
                          color: color),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/svg/cart_logo.svg'),
            ),
          ],
        ),
      ],
    );
  }
}
