import 'package:flutter/material.dart';

class SplashCover extends StatefulWidget {
  const SplashCover({super.key});

  @override
  State<SplashCover> createState() => _SplashCoverState();
}

class _SplashCoverState extends State<SplashCover>
    with SingleTickerProviderStateMixin {
  late AnimationController _coverAnimationController;
  late Animation<Offset> _coverAnimation;

  @override
  void initState() {
    super.initState();
    _coverAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _coverAnimation = Tween<Offset>(
      begin: Offset(0, -1.3),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: _coverAnimationController, curve: Curves.easeInOut));
    Future.delayed(Duration(seconds: 1), () {
      _coverAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _coverAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (index) => Container(
            width: MediaQuery.of(context).size.width / 3.1,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
              ),
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
