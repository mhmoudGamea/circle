import 'package:circle/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/app_styles.dart';
import '../../../providers/categories/category_provider.dart';
import 'custom_sub_category_list.dart';

class CustomSubCategoryListConsumer extends StatelessWidget {
  const CustomSubCategoryListConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    return Selector<CategoryProvider, int>(
      selector: (_, provider) => provider.selectedIndex,
      builder: (context, value, child) {
        return provider.categoriesModelList.isEmpty
            ? SizedBox(
                child: Text(
                  'Still empty',
                  style: AppStyles.b14.copyWith(color: AppColors.primaryColor),
                ),
              )
            : CustomSubCategoryList(
                categoriesModelList: provider
                    .categoriesModelList[provider.selectedIndex]
                    .subCategories!);
      },
    );
  }
}
