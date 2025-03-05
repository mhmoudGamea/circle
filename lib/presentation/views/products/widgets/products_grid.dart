import 'package:flutter/material.dart';

import '../../../../core/navigator/navigator.dart';
import '../../../../data/models/home/latest_products/latest_products_model.dart';
import '../../../widgets/latest_products_grid_item.dart';
import '../../details/details_view.dart';

class ProductsGrid extends StatelessWidget {
  final List<LatestProductsModel> latestProductsModel;
  const ProductsGrid({super.key, required this.latestProductsModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: latestProductsModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 6,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          NavigatorHandler.push(
              DetailsView(latestProductsModel: latestProductsModel[index]));
        },
        child: LatestProductsGridItem(
          latestProductsModel: latestProductsModel[index],
        ),
      ),
    );
  }
}
