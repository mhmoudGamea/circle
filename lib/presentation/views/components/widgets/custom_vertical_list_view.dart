import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/views/components/widgets/custom_vertical_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/home/categories/categories_model.dart';

class CustomVerticalListView extends StatelessWidget {
  const CustomVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: CategoriesModel.categoriesModel.subCategories.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          context.read<MainProvider>().setSelectedGridItemIndex(index);
        },
        child: CustomVerticalListViewItem(
          image: CategoriesModel.categoriesModel.subCategories[index].image,
          title: CategoriesModel.categoriesModel.subCategories[index].title,
          isSelected: context.watch<MainProvider>().selectedIndex == index,
        ),
      ),
    );
  }
}
