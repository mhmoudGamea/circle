import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'splash_cart_logo.dart';
import 'splash_cover.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashCover(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashCartLogo(),
              SizedBox(height: 22),
              SvgPicture.asset('assets/images/svg/circle_logo.svg'),
              SizedBox(height: 8),
              SvgPicture.asset('assets/images/svg/text_logo.svg'),
            ],
          ),
        ),
      ],
    );
  }
}
