import 'package:circle/core/navigator/navigator.dart';
import 'package:circle/data/models/home/latest_products/latest_products_model.dart';
import 'package:circle/presentation/providers/home/home_provider.dart';
import 'package:circle/presentation/views/details/details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          NavigatorHandler.push(
              DetailsView(latestProductsModel: latestProductsModel[index]));
        },
        child: Selector<HomeProvider, bool>(
          selector: (_, provider) => provider.isLoadingLatestProducts,
          builder: (context, value, child) => Skeletonizer(
            enabled: value,
            child: LatestProductsGridItem(
              latestProductsModel: latestProductsModel[index],
            ),
          ),
        ),
      ),
    );
  }
}
