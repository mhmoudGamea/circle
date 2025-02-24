import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/widgets/custom_app_bar.dart';
import 'package:circle/presentation/widgets/custom_cart_circle_logo.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_styles.dart';
import '../../../core/constants/constants.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'about_app.appBarTitle'.tr(),
        showToolBar: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.border),
        child: Column(
          children: [
            SizedBox(height: 32),
            CustomCartCircleLogo(),
            SizedBox(height: 32),
            Row(
              spacing: 10,
              children: [
                CustomSvgIcon(
                    assetName: 'about_app_view', width: 22.w, height: 22.w),
                Text(
                  'about_app.whoWeAre'.tr(),
                  style: AppStyles.b16,
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'about_app.description'.tr(),
              style: AppStyles.r14.copyWith(color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
