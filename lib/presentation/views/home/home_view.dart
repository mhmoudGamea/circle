import 'package:circle/presentation/providers/home/home_provider.dart';
import 'package:circle/presentation/widgets/custom_carousel_slider.dart';
import 'package:circle/presentation/widgets/custom_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          SizedBox(height: Dimens.padding_16h),
          CustomCarouselSlider(
              carouselList: context.read<HomeProvider>().images),
          SizedBox(height: Dimens.padding_24h),
          CustomHeader(
            leading: 'home.Sections.title'.tr(),
            trailing: 'home.Sections.viewAll'.tr(),
            trailingOnTap: () {},
          ),
          // sections grid view
          CustomHeader(
            leading: 'home.offers.title'.tr(),
            trailing: 'home.offers.viewAll'.tr(),
            trailingOnTap: () {
              print('hello extension');
            },
          ),
          // offer grid view
        ],
      ),
    );
  }
}
