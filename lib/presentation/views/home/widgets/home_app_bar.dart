import 'dart:developer';

import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/widgets/custom_cart_logo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/app_styles.dart';
import 'home_app_bar_action_icon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      leading: Row(
        spacing: 8,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCartLogo(
                lineColor: AppColors.primaryColor,
                cartColor: AppColors.dark,
                cartWidth: 23,
                cartHeight: 23,
                lineHeight: 10,
                lineWidth: 1,
              ),
            ],
          ),
          Column(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'home.appBar.welcome'.tr(),
                style: AppStyles.r14.copyWith(color: AppColors.gray),
              ),
              Consumer<MainProvider>(
                builder: (context, provider, child) {
                  log('in home app bar class');
                  log(provider.firstName);
                  log(provider.lastName);

                  return Text(
                    '${provider.firstName} ${provider.lastName}',
                    style: AppStyles.b16,
                  );
                },
              ),
            ],
          )
        ],
      ),
      leadingWidth: double.infinity,
      centerTitle: false,
      actions: [
        HomeAppBarActionIcon(iconName: 'notification', onTap: () {}),
        SizedBox(width: 8),
        HomeAppBarActionIcon(iconName: 'basket', number: '3', onTap: () {}),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 90.h);
}
