import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/utils/helper.dart';
import 'package:circle/data/models/home/categories/categories_model.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
// import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

class CustomSubCategoryList extends StatelessWidget {
  final List<CategoriesModel> categoriesModelList;
  const CustomSubCategoryList({super.key, required this.categoriesModelList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categoriesModelList.length,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => CustomBorderedContainer(
        borderColor: AppColors.inputBackground,
        child: Text(categoriesModelList[index].title!),
      ),
    );
  }
}
