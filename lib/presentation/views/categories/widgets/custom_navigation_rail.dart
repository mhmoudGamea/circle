import 'package:circle/presentation/providers/categories/category_provider.dart';
import 'package:circle/presentation/views/categories/widgets/custom_vertical_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../main.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = navigatorKey.currentContext!.locale.languageCode == 'ar';
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 90,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 1, color: AppColors.inputBackground),
        borderRadius: isArabic
            ? BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              )
            : BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
      ),
      child: Selector<CategoryProvider, bool>(
        selector: (_, provider) => provider.isLoadingCategory,
        builder: (context, value, child) => Skeletonizer(
          enabled: value,
          child: CustomVerticalListView(
              categoriesModelList:
                  context.read<CategoryProvider>().categoriesModelList),
        ),
        // child: ,
      ),
    );
  }
}
