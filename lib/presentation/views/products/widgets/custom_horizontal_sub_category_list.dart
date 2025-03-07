import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/home/latest_products/latest_products_model.dart';
import '../../../providers/products/products_provider.dart';
import 'custom_horizontal_sub_category_list_item.dart';

class CustomHorizontalSubCategoryList extends StatelessWidget {
  const CustomHorizontalSubCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      color: Colors.transparent,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount:
            LatestProductsModel.dummyData[0].category.subCategories!.length,
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context
                .read<ProductsProvider>()
                .setSelectedLatestProductIndex(index);
          },
          child: CustomHorizontalSubCategoryListItem(
            title: LatestProductsModel
                .dummyData[0].category.subCategories![index].title!,
            isSelected:
                context.watch<ProductsProvider>().selectedLatestProductIndex ==
                    index,
          ),
        ),
      ),
    );
  }
}
