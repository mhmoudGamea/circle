import 'package:circle/data/models/home/latest_products/latest_products_model.dart';
import 'package:flutter/material.dart';

import 'latest_products_grid_item.dart';

class LatestProductsGrid extends StatelessWidget {
  final List<LatestProductsModel> latestProductsModel;
  const LatestProductsGrid({super.key, required this.latestProductsModel});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: latestProductsModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 6,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) => LatestProductsGridItem(
        latestProductsModel: latestProductsModel[index],
      ),
    );
  }
}
