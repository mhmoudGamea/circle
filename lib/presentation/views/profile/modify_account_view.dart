import 'package:circle/core/constants/constants.dart';
import 'package:circle/presentation/widgets/custom_app_bar.dart';
import 'package:circle/presentation/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../providers/profile/profile_provider.dart';
import '../../widgets/custom_avatar_image.dart';
import '../signup/widgets/custom_first_last_name.dart';

class ModifyAccountView extends StatelessWidget {
  const ModifyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'modify_account.appBarTitle'.tr(),
        showToolBar: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.border),
        child: Column(
          children: [
            CustomAvatarImage<ProfileProvider>(
              icon: 'profile_user_edit_icon',
              iconBgColor: AppColors.white,
              iconAlignment: Alignment.bottomLeft,
              avatarBorderColor: AppColors.primaryColor,
            ),
            SizedBox(height: 32),
            CustomFirstLastName(),
            Spacer(),
            CustomButton(title: 'modify_account.buttonTitle', onTap: () {}),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
