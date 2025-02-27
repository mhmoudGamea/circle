import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:flutter/material.dart';

class CustomSubCategoryList extends StatelessWidget {
  const CustomSubCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => CustomBorderedContainer(
        borderColor: AppColors.inputBackground,
        child: Text('data'),
      ),
    );
  }
}
