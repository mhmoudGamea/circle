import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../login/views/login_view.dart';

class SplashCartLogo extends StatefulWidget {
  const SplashCartLogo({super.key});

  @override
  State<SplashCartLogo> createState() => _SplashCartLogoState();
}

class _SplashCartLogoState extends State<SplashCartLogo>
    with TickerProviderStateMixin {
  late AnimationController _cart0AnimationController;
  late AnimationController _cart1AnimationController;
  late AnimationController _lineAnimationController;

  late Animation<double> _cart0Animation;
  late Animation<double> _cart1Animation;
  late Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    _cart0AnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _cart1AnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _lineAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _cart0Animation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _cart0AnimationController, curve: Curves.easeInOut));
    _cart1Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _cart1AnimationController, curve: Curves.easeInOut));
    _lineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _lineAnimationController, curve: Curves.easeInOut));
    Future.delayed(Duration(seconds: 1), () {
      _cart0AnimationController.forward();
      _lineAnimationController.forward();
      _lineAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
              parent: _lineAnimationController, curve: Curves.easeInOut));
      setState(() {});
    });
    _cart0AnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _cart1AnimationController.forward();
      }
    });
    _cart1AnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        GoRouter.of(context).pushReplacement(LoginView.rn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FadeTransition(
          opacity: _lineAnimation,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 23,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => SvgPicture.asset('assets/images/svg/bg1.svg'),
                  ),
                ),
              ),
            ),
          ),
        ),
        FadeTransition(
          opacity: _cart0Animation,
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/svg/cart_logo.svg'),
          ),
        ),
        FadeTransition(
          opacity: _cart1Animation,
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/svg/cart0_logo.svg'),
          ),
        ),
      ],
    );
  }
}
