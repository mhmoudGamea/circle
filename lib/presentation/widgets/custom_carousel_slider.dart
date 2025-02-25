import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle/presentation/widgets/custom_asset_image.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<String> carouselList;
  const CustomCarouselSlider({super.key, required this.carouselList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        carouselList.length,
        (index) => CustomAssetImage(assetName: carouselList[index], radius: 16),
      ),
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.85,
        aspectRatio: 2.0,
      ),
    );
  }
}
