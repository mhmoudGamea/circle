import 'package:circle/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const rn = '/';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showToolBar: false,
        systemUiOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}
