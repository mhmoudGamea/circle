import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

class SplashCartLogo extends StatelessWidget {
  const SplashCartLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                3,
                (index) => CustomSvgIcon(
                  assetName: 'bg1',
                  width: 12.w,
                  height: 12.w,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomSvgIcon(
            assetName: 'cart_logo',
            width: 40.w,
            height: 40.w,
          ),
        ),
      ],
    );
  }
}
