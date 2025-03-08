import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/home/categories/categories_model.dart';
import '../../../providers/products/products_provider.dart';
import 'custom_horizontal_sub_category_list_item.dart';

class CustomHorizontalSubCategoryList extends StatelessWidget {
  final List<CategoriesModel> subCategoryList;
  const CustomHorizontalSubCategoryList(
      {super.key, required this.subCategoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      color: Colors.transparent,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: subCategoryList.length,
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context
                .read<ProductsProvider>()
                .setSelectedLatestProductIndex(index);
          },
          child: CustomHorizontalSubCategoryListItem(
            title: subCategoryList[index].title!,
            isSelected:
                context.watch<ProductsProvider>().selectedSubCategoryIndex ==
                    index,
          ),
        ),
      ),
    );
  }
}
