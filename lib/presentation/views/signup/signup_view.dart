import 'package:circle/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../providers/signup/signup_provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_drop_down_container.dart';
import 'widgets/custom_envited_by_user.dart';
import 'widgets/custom_first_last_name.dart';
import '../../widgets/custom_avatar_image.dart';
import 'widgets/drop_down_city_button.dart';

class SignupView extends StatelessWidget {
  final String phoneCode;
  final String phone;
  const SignupView({super.key, required this.phoneCode, required this.phone});

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'signup.createAccount'.tr(),
        showToolBar: true,
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.border),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 14),
                  CustomAvatarImage<SignupProvider>(
                    icon: 'signup_add_image_icon',
                    iconBgColor: AppColors.primaryColor,
                    iconAlignment: Alignment.bottomRight,
                    avatarBorderColor: AppColors.inputBackground,
                  ),
                  SizedBox(height: 32),
                  CustomFirstLastName(),
                  SizedBox(height: 32),
                  CustomDropDownContainer(
                    enableBorder: true,
                    height: 70.h,
                    dropDown: DropDownCityButton(
                      prefixIconName: 'city',
                      prefixIconColor: AppColors.primaryColor,
                      titleColor: AppColors.dark,
                      iconSize: 22.w,
                      iconColor: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 32),
                  CustomEnvitedByUser(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Selector<SignupProvider, bool>(
                selector: (_, provider) => provider.loginLoading,
                builder: (context, value, child) => value
                    ? CircularProgressIndicator(color: AppColors.primaryColor)
                    : child!,
                child: CustomButton(
                  title: 'signup.buttonTitle',
                  onTap: () async {
                    if (signupProvider.validate()) {
                      await signupProvider.signupUser(
                          context: context, phone: phone, phoneCode: phoneCode);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
