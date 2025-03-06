import 'package:circle/presentation/providers/component/component_provider.dart';
import 'package:circle/presentation/views/components/widgets/custom_vertical_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/home/categories/categories_model.dart';

class CustomVerticalListView extends StatelessWidget {
  final List<CategoriesModel> categoriesModelList;
  const CustomVerticalListView({super.key, required this.categoriesModelList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categoriesModelList.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          //TODO: get subcategory products
          context.read<ComponentProvider>().changeGridItemIndex(index);
        },
        child: CustomVerticalListViewItem(
          image: categoriesModelList[index].image!,
          title: categoriesModelList[index].title!,
          isSelected: context.watch<ComponentProvider>().selectedIndex == index,
        ),
      ),
    );
  }
}
