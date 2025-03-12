import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/providers/profile/profile_provider.dart';
import 'package:circle/presentation/views/profile/widgets/custom_bottom_cover.dart';
import 'package:circle/presentation/views/profile/widgets/custom_top_cover.dart';
import 'package:circle/presentation/widgets/custom_avatar_image.dart';
import 'package:circle/presentation/widgets/custom_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../providers/main/main_provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ProfileProvider, bool>(
      selector: (_, provider) => provider.languageChanged,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.border),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CustomAvatarImage<ProfileProvider>(
                  icon: 'profile_user_edit_icon',
                  iconBgColor: AppColors.white,
                  iconAlignment: Alignment.bottomLeft,
                  avatarBorderColor: AppColors.primaryColor,
                ),
                SizedBox(height: 12),
                Consumer<MainProvider>(
                  builder: (context, provider, child) => Text(
                    '${provider.firstName} ${provider.lastName}',
                    style: AppStyles.b16,
                  ),
                ),
                SizedBox(height: 28),
                CustomTopCover(),
                SizedBox(height: 16),
                CustomBottomCover(),
                SizedBox(height: 16),
                CustomIconButton(
                  onTap: () {},
                  borderColor: AppColors.lightGray,
                  borderRadius: 16.w,
                  width: 170.w,
                  height: 56.w,
                  titleColor: AppColors.lightGray,
                  title: 'profile.logout'.tr(),
                  icon: 'log_out',
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
