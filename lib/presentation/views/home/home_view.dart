import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/dimens/dimens.dart';
import '../../../core/navigator/navigator.dart';
import '../../../data/models/home/categories/categories_model.dart';
import '../../../data/models/home/latest_products/product_model.dart';
import '../../providers/home/home_provider.dart';
import '../../providers/main/main_provider.dart';
import '../../providers/products/products_provider.dart';
import '../../providers/profile/profile_provider.dart';
import '../../widgets/custom_carousel_slider.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/sliver_product_grid.dart';
import '../products/products_view.dart';
import 'widgets/categories_grid.dart';
import 'widgets/city_search_bar.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
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
                    trailingOnTap: () {
                      context.read<MainProvider>().changeIndex(1);
                    },
                  ),
                  SizedBox(height: Dimens.padding_12h),
                ],
              ),
            ),
            // categories grid view
            Selector<HomeProvider, List<CategoriesModel>>(
              selector: (_, provider) => provider.categoriesModelList,
              builder: (context, value, child) => Skeletonizer.sliver(
                enabled: value.isEmpty,
                child: CategoriesGrid(
                  categoriesModel:
                      value.isEmpty ? CategoriesModel.dummyCategory() : value,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomHeader(
                    leading: 'home.offers.title'.tr(),
                    trailing: 'home.offers.viewAll'.tr(),
                    trailingOnTap: () async {
                      productsProvider.setSelectedCategoryIndex(-1);
                      productsProvider.setSelectedSubCategoryIndex(-1);
                      await productsProvider.getProduct();
                      NavigatorHandler.push(ProductsView());
                    },
                  ),
                  SizedBox(height: Dimens.padding_12h),
                ],
              ),
            ),
            // latest products grid view
            Selector<HomeProvider, List<ProductModel>>(
              selector: (_, provider) => provider.latestProductsModelList,
              builder: (context, value, child) => Skeletonizer.sliver(
                enabled: value.isEmpty,
                child: SliverProductGrid(
                  productModel: value.isEmpty
                      ? ProductModel.dummyLatestProducts()
                      : value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
