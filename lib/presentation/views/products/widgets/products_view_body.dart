import 'package:circle/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../data/models/home/categories/categories_model.dart';
import '../../../../data/models/home/latest_products/product_model.dart';
import '../../../providers/products/products_provider.dart';
import '../../../widgets/custom_svg_icon.dart';
import '../../../widgets/custom_text_form.dart';
import 'custom_horizontal_category_list.dart';
import 'custom_horizontal_sub_category_list.dart';
import 'products_grid.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    return Column(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
          child: CustomTextForm(
            controller: TextEditingController(),
            height: 70.h,
            hint: 'home.searchField'.tr(),
            prefix: CustomSvgIcon(assetName: 'search', width: 20, height: 20),
            isFill: true,
            fillColor: AppColors.inputBackground,
          ),
        ),
        SizedBox(height: 8),
        // in this CustomHorizontalCategoryList
        Selector<ProductsProvider, List<CategoriesModel>>(
          selector: (_, provider) => provider.categoriesModelList,
          builder: (context, value, child) => Skeletonizer(
            enabled: value.isEmpty,
            child: Column(
              children: [
                CustomHorizontalCategoryList(
                  categoriesModelList:
                      value.isEmpty ? CategoriesModel.dummyCategory() : value,
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
                  child: Selector<ProductsProvider, int>(
                    selector: (_, provider) => provider.selectedCategoryIndex,
                    builder: (_, value, child) =>
                        CustomHorizontalSubCategoryList(
                      subCategoryList: provider.categoriesModelList.isEmpty
                          ? CategoriesModel.dummySubCategory()
                          : provider.getSelectedSubCategories(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Selector<ProductsProvider, List<ProductModel>>(
            selector: (_, provider) => provider.productList,
            builder: (context, value, child) => Skeletonizer(
              enabled: value.isEmpty,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: ProductGrid(
                  productModel: value.isEmpty
                      ? ProductModel.dummyLatestProducts()
                      : value,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
