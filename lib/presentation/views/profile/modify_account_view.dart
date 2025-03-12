import 'dart:developer';

import 'package:circle/core/constants/constants.dart';
import 'package:circle/presentation/providers/modify_account/modify_account_provider.dart';
import 'package:circle/presentation/views/profile/widgets/modify_account_form.dart';
import 'package:circle/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/services/prefs.dart';
import '../../widgets/custom_avatar_image.dart';

class ModifyAccountView extends StatelessWidget {
  const ModifyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    log(Prefs.get(Constants.image).toString());

    log(Prefs.get(Constants.firstName).toString());
    log(Prefs.get(Constants.lastName).toString());
    return Scaffold(
      appBar: CustomAppBar(
        title: 'modify_account.appBarTitle'.tr(),
        showToolBar: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.border),
        child: Column(
          children: [
            CustomAvatarImage<ModifyAccountProvider>(
              icon: 'profile_user_edit_icon',
              iconBgColor: AppColors.white,
              iconAlignment: Alignment.bottomLeft,
              avatarBorderColor: AppColors.primaryColor,
            ),
            SizedBox(height: 32),
            Expanded(child: ModifyAccountForm()),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
