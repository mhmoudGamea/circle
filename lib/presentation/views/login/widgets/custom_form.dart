import 'package:circle/core/utils/helper.dart';
import 'package:circle/presentation/providers/otp/otp_provider.dart';
import 'package:circle/presentation/views/login/widgets/custom_login_bottom_sheet_widget.dart';
import 'package:circle/presentation/widgets/custom_drop_down_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../widgets/custom_button.dart';

import '../../../providers/login/login_provider.dart';
import 'drop_down_country_button.dart';
import 'custom_text_form_field.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Column(
      children: [
        CustomDropDownContainer(
          backgroundColor: AppColors.inputBackground,
          dropDown: DropDownCountryButton(),
        ),
        SizedBox(height: 16),
        ValueListenableBuilder(
          valueListenable: loginProvider.autovalidateModeNotifier,
          builder: (context, value, child) => Form(
            key: loginProvider.formKey,
            autovalidateMode: value,
            child: Column(
              children: [
                CustomTextFormField(
                  icon: 'phone',
                  label: 'login.textFieldPhone'.tr(),
                  controller: loginProvider.controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'login.textFieldRequired'.tr();
                    } else if (value.length < 11) {
                      return 'login.textFieldNotValid'.tr();
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 24),
                child!
              ],
            ),
          ),
          child: CustomButton(
            title: 'login.buttonTitle'.tr(),
            onTap: () {
              if (loginProvider.validate()) {
                context.read<OtpProvider>().startTimer();
                Helper.showCustomModalBottomSheet(
                  widget: CustomLoginBottomSheetWidget(),
                );
              }
            },
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
