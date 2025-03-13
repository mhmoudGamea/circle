import 'package:flutter/material.dart';

import '../../../../core/navigator/navigator.dart';
import '../../../../data/models/home/latest_products/product_model.dart';
import '../../../widgets/product_grid_item.dart';
import '../../details/details_view.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> productModel;
  const ProductGrid({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productModel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 6,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          NavigatorHandler.push(DetailsView(productModel: productModel[index]));
        },
        child: ProductGridItem(
          productModel: productModel[index],
        ),
      ),
    );
  }
}
