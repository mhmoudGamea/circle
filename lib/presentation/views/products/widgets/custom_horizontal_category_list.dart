import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/data/models/home/categories/categories_model.dart';
import 'package:circle/presentation/providers/products/products_provider.dart';
import 'package:circle/presentation/views/products/widgets/custom_horizontal_category_list_item.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomHorizontalCategoryList extends StatelessWidget {
  final List<CategoriesModel> categoriesModelList;
  const CustomHorizontalCategoryList(
      {super.key, required this.categoriesModelList});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    return CustomBorderedContainer(
      bg: AppColors.navRailBackgroundButtonColor,
      borderColor: Colors.transparent,
      borderRadius: 0,
      padding: 0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categoriesModelList.length + 1,
        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                context.read<ProductsProvider>().getSubCategories();
              },
              child: CustomHorizontalCategoryListItem(
                title: 'الكل',
                isSelected:
                    context.watch<ProductsProvider>().selectedCategoryIndex ==
                        -1,
              ),
            );
          }
          final realIndex = index - 1;
          return InkWell(
            onTap: () {
              productProvider.getProduct(
                  categoryId: '${categoriesModelList[realIndex].id}');
              // just for border red color of selected category and sub category
              productProvider.setSelectedSubCategoryIndex(-1);
              productProvider.setSelectedCategoryIndex(realIndex);
            },
            child: CustomHorizontalCategoryListItem(
              image: categoriesModelList[realIndex].image!,
              title: categoriesModelList[realIndex].title!,
              isSelected:
                  context.watch<ProductsProvider>().selectedCategoryIndex ==
                      realIndex,
            ),
          );
        },
      ),
    );
  }
}
