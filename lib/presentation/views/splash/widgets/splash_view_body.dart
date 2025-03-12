import 'package:circle/core/constants/constants.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/core/services/prefs.dart';
import 'package:circle/presentation/views/main/main_view.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigator/navigator.dart';
import '../../login/login_view.dart';
import 'splash_cart_logo.dart';
import 'splash_cover.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        if (Prefs.get(Constants.phoneNumber) != null) {
          NavigatorHandler.pushReplacement(
            const MainView(),
          );
        } else {
          NavigatorHandler.pushReplacement(
            const LoginView(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SplashCover(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashCartLogo(),
              SizedBox(height: 22),
              CustomSvgIcon(
                  assetName: 'circle_logo', width: 45.w, height: 45.w),
              SizedBox(height: 8),
              CustomSvgIcon(assetName: 'text_logo', width: 13.w, height: 13.w),
            ],
          ),
        )
      ],
    );
  }
}
