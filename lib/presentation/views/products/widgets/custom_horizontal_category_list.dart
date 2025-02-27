import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/data/models/home/categories/categories_model.dart';
import 'package:circle/presentation/providers/products/products_provider.dart';
import 'package:circle/presentation/views/products/widgets/custom_horizontal_category_list_item.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomHorizontalCategoryList extends StatelessWidget {
  const CustomHorizontalCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
      bg: AppColors.navRailBackgroundButtonColor,
      borderColor: Colors.transparent,
      borderRadius: 0,
      padding: 0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: CategoriesModel.categoriesModel.subCategories.length,
        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.read<ProductsProvider>().setSelectedCategoryIndex(index);
          },
          child: CustomHorizontalCategoryListItem(
            title: CategoriesModel.categoriesModel.subCategories[index].title,
            isSelected:
                context.watch<ProductsProvider>().selectedCategoryIndex ==
                    index,
          ),
        ),
      ),
    );
  }
}
