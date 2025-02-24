import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/navigator/navigator.dart';
import 'package:circle/core/utils/helper.dart';
import 'package:circle/presentation/providers/profile/profile_provider.dart';
import 'package:circle/presentation/views/profile/about_app_view.dart';
import 'package:circle/presentation/views/profile/contact_view.dart';
import 'package:circle/presentation/widgets/custom_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../widgets/custom_bordered_container.dart';
import '../modify_account_view.dart';
import 'custom_bottom_cover_item.dart';
import 'delete_account.dart';

class CustomBottomCover extends StatelessWidget {
  const CustomBottomCover({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
      bg: AppColors.coverColor,
      borderColor: Colors.transparent,
      isExpanded: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'profile.settings'.tr(),
            style: AppStyles.b13.copyWith(color: AppColors.gray),
          ),
          CustomBottomCoverItem(
            onTap: () {
              NavigatorHandler.push(ModifyAccountView());
            },
            icon: 'profile_user_edit_icon',
            title: 'profile.editProfile'.tr(),
          ),
          CustomBottomCoverItem(
            onTap: () {
              Helper.showCustomModalBottomSheet(
                widget: CustomBottomSheetWidget(
                  title: 'profile.language'.tr(),
                  firstSelection: 'العربي',
                  secondSelection: "English",
                  buttonTitle: 'profile.languageButton'.tr(),
                  close: () {
                    NavigatorHandler.pop();
                  },
                  confirm: () {
                    context.read<ProfileProvider>().changeLanguage(context);
                    NavigatorHandler.pop();
                  },
                ),
              );
            },
            icon: 'language',
            title: 'profile.language'.tr(),
          ),
          CustomBottomCoverItem(
            onTap: () {
              NavigatorHandler.push(ContactView());
            },
            icon: 'contact',
            title: 'profile.contactWithUs'.tr(),
          ),
          CustomBottomCoverItem(
            onTap: () {
              NavigatorHandler.push(AboutAppView());
            },
            icon: 'about_app',
            title: 'profile.aboutApp'.tr(),
          ),
          CustomBottomCoverItem(
            onTap: () {},
            icon: 'rate_app',
            title: 'profile.rateApp'.tr(),
          ),
          SizedBox(height: 10),
          DeleteAccount(
              icon: 'delete_account', title: 'profile.deleteAccount'.tr()),
        ],
      ),
    );
  }
}
