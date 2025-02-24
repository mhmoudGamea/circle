import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_cart_logo.dart';

class CustomCartCircleLogo extends StatelessWidget {
  const CustomCartCircleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCartLogo(
          lineColor: Colors.black,
          cartColor: Colors.black,
        ),
        SizedBox(height: 22),
        SvgPicture.asset('assets/images/svg/circle_logo.svg'),
        SizedBox(height: 8),
        SvgPicture.asset('assets/images/svg/text_logo.svg'),
      ],
    );
  }
}
