import 'package:flutter/material.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../providers/products/products_provider.dart';
import '../../../widgets/custom_svg_icon.dart';
import '../../../widgets/custom_text_form.dart';
import '../../../widgets/latest_products_grid.dart';
import 'custom_horizontal_category_list.dart';
import 'custom_horizontal_sub_category_list.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
                child: CustomTextForm(
                  controller: TextEditingController(),
                  height: 70.h,
                  hint: 'home.searchField'.tr(),
                  prefix:
                      CustomSvgIcon(assetName: 'search', width: 20, height: 20),
                  isFill: true,
                  fillColor: AppColors.inputBackground,
                ),
              ),
              SizedBox(height: 8),
              CustomHorizontalCategoryList(),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
                child: CustomHorizontalSubCategoryList(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Selector<ProductsProvider, bool>(
          selector: (_, provider) => provider.isLoadingLatestProducts,
          builder: (context, value, child) => Skeletonizer.sliver(
            enabled: value,
            child: LatestProductsGrid(
              latestProductsModel:
                  context.read<ProductsProvider>().latestProductsModelList,
            ),
          ),
        ),
      ],
    );
  }
}
