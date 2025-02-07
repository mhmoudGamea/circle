import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/custom_cart_logo.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCartLogo(color: Colors.black),
          SizedBox(height: 22),
          SvgPicture.asset('assets/images/svg/circle_logo.svg'),
          SizedBox(height: 8),
          SvgPicture.asset('assets/images/svg/text_logo.svg'),
        ],
      ),
    );
  }
}
