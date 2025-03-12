import 'dart:developer';

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

class SignupView extends StatefulWidget {
  final String phoneCode;
  final String phone;
  const SignupView({super.key, required this.phoneCode, required this.phone});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  // form
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  // validate mode
  final ValueNotifier<AutovalidateMode> _signupAutoValidateModeNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  // first name controller
  final TextEditingController _signupFirstNameEditingController =
      TextEditingController();
  // last name controller
  final TextEditingController _signupLastNameEditingController =
      TextEditingController();

  bool validate() {
    if (_signupFormKey.currentState!.validate()) {
      _signupFormKey.currentState!.save();
      return true;
    } else {
      _signupAutoValidateModeNotifier.value = AutovalidateMode.always;
      return false;
    }
  }

  @override
  void dispose() {
    log('dispose of form in sigup is called');
    _signupFirstNameEditingController.dispose();
    _signupLastNameEditingController.dispose();
    _signupAutoValidateModeNotifier.dispose();
    super.dispose();
  }

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
            Expanded(
              child: SingleChildScrollView(
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
                    ValueListenableBuilder(
                      valueListenable: _signupAutoValidateModeNotifier,
                      builder: (context, value, child) => Form(
                        key: _signupFormKey,
                        autovalidateMode: value,
                        child: CustomFirstLastName(
                          firstNameEditingController:
                              _signupFirstNameEditingController,
                          lastNameEditingController:
                              _signupLastNameEditingController,
                          firstNameLabel: 'signup.textFieldFirstName',
                          lastNameLabel: 'signup.textFieldLastName',
                          firstNameRequired: 'signup.textFieldRequired',
                          lastNameRequired: 'signup.textFieldRequired',
                        ),
                      ),
                    ),
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
            ),
            Selector<SignupProvider, bool>(
              selector: (_, provider) => provider.signupLoading,
              builder: (context, value, child) => value
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : child!,
              child: CustomButton(
                title: 'signup.buttonTitle',
                onTap: () async {
                  if (validate()) {
                    await signupProvider.signupUser(
                        context: context,
                        firstName: _signupFirstNameEditingController.text,
                        lastName: _signupLastNameEditingController.text,
                        phone: widget.phone,
                        phoneCode: widget.phoneCode);
                  }
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
