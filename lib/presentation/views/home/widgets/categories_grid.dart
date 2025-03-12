import 'package:circle/presentation/providers/products/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/navigator/navigator.dart';
import '../../../../data/models/home/categories/categories_model.dart';
import '../../products/products_view.dart';
import 'categories_grid_item.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoriesModel> categoriesModel;
  const CategoriesGrid({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    return SliverGrid.builder(
      itemCount: categoriesModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          // provider.changeGridItemIndex(index);
          provider.setSelectedCategoryIndex(index);
          NavigatorHandler.push(ProductsView());
        },
        child: CategoriesGridItem(
            image: categoriesModel[index].image!,
            title: categoriesModel[index].title!),
      ),
    );
  }
}
