import 'package:flutter/material.dart';

import '../../../core/dimens/dimens.dart';
import 'widgets/city_search_bar.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
      child: Column(
        children: [
          SizedBox(height: Dimens.padding_8h),
          HomeAppBar(),
          SizedBox(height: Dimens.padding_8h),
          CitySearchBar(),
        ],
      ),
    );
  }
}
