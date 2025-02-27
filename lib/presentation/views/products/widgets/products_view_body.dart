import 'package:circle/data/models/home/latest_products/latest_products_model.dart';
import 'package:circle/presentation/views/products/widgets/custom_horizontal_category_list.dart';
import 'package:circle/presentation/views/products/widgets/custom_horizontal_latest_products_list.dart';
import 'package:flutter/material.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../widgets/custom_svg_icon.dart';
import '../../../widgets/custom_text_form.dart';
import 'products_grid.dart';

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
                child: CustomHorizontalLatestProductsList(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
            child: ProductsGrid(
                latestProductsModel: LatestProductsModel.dummyData),
          ),
        ),
      ],
    );
  }
}
