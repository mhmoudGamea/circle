import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/dimens/dimens.dart';
import 'package:circle/presentation/views/home/widgets/drop_down_city_button.dart';
import 'package:circle/presentation/widgets/custom_app_bar.dart';
import 'package:circle/presentation/widgets/custom_drop_down_container.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showToolBar: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
        child: Column(
          children: [
            Row(
              children: [
                CustomDropDownContainer(
                  dropDown: DropDownCityButton(),
                  width: 150,
                  backgroundColor: AppColors.primaryColor,
                ),
                // CustomTextForm(controller: controller, label: label)
              ],
            )
          ],
        ),
      ),
    );
  }
}
