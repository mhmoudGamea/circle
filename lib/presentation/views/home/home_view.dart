import 'package:circle/presentation/providers/home/home_provider.dart';
import 'package:circle/presentation/providers/profile/profile_provider.dart';
import 'package:circle/presentation/views/home/widgets/categories_grid.dart';
import 'package:circle/presentation/widgets/latest_products_grid.dart';
import 'package:circle/presentation/views/products/products_view.dart';
import 'package:circle/presentation/widgets/custom_carousel_slider.dart';
import 'package:circle/presentation/widgets/custom_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/dimens/dimens.dart';
import '../../../core/navigator/navigator.dart';
import 'widgets/city_search_bar.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ProfileProvider, bool>(
      selector: (_, provider) => provider.languageChanged,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: Dimens.padding_8h),
                  HomeAppBar(),
                  SizedBox(height: Dimens.padding_16h),
                  CitySearchBar(),
                  SizedBox(height: Dimens.padding_16h),
                  CustomCarouselSlider(
                      carouselList: context.read<HomeProvider>().images),
                  SizedBox(height: Dimens.padding_24h),
                  CustomHeader(
                    leading: 'home.categories.title'.tr(),
                    trailing: 'home.categories.viewAll'.tr(),
                    trailingOnTap: () {},
                  ),
                  SizedBox(height: Dimens.padding_12h),
                ],
              ),
            ),
            // categories grid view
            Selector<HomeProvider, bool>(
              selector: (_, provider) => provider.isLoadingCategory,
              builder: (context, value, child) => Skeletonizer.sliver(
                enabled: value,
                child: CategoriesGrid(
                    categoriesModel:
                        context.read<HomeProvider>().categoriesModelList),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomHeader(
                    leading: 'home.offers.title'.tr(),
                    trailing: 'home.offers.viewAll'.tr(),
                    trailingOnTap: () {
                      NavigatorHandler.push(ProductsView());
                    },
                  ),
                  SizedBox(height: Dimens.padding_12h),
                ],
              ),
            ),
            // latest products grid view
            Selector<HomeProvider, bool>(
              selector: (_, provider) => provider.isLoadingLatestProducts,
              builder: (context, value, child) => Skeletonizer.sliver(
                enabled: value,
                child: LatestProductsGrid(
                    latestProductsModel:
                        context.read<HomeProvider>().latestProductsModelList),
              ),
            ),
            // LatestProductsGrid(
            //     latestProductsModel: LatestProductsModel.dummyData),
          ],
        ),
      ),
    );
  }
}
