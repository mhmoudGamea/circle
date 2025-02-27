import 'package:circle/data/models/home/categories/categories_model.dart';
import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/views/home/widgets/categories_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoriesModel> model;
  const CategoriesGrid({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: model.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          context.read<MainProvider>().setSelectedGridItemIndex(index);
        },
        child: CategoriesGridItem(
            image: model[index].image, title: model[index].title),
      ),
    );
  }
}
