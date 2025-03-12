import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../providers/login/login_provider.dart';
import '../../../widgets/custom_drop_down_container.dart';
import 'drop_down_country_button.dart';
import 'custom_text_form_field.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  // form key
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  // form Auto validate mode
  final ValueNotifier<AutovalidateMode> _loginAutoValidateModeNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  // phone text form field
  final TextEditingController _phoneNumberController = TextEditingController();

  // validation
  bool validate() {
    if (_loginFormKey.currentState!.validate() &&
        _phoneNumberController.text.length == 10) {
      _loginFormKey.currentState!.save();
      return true;
    } else {
      _loginAutoValidateModeNotifier.value = AutovalidateMode.always;
      return false;
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _loginAutoValidateModeNotifier.dispose();
    super.dispose();
  }

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
        Column(
          children: [
            ValueListenableBuilder(
              valueListenable: _loginAutoValidateModeNotifier,
              builder: (context, value, child) => Form(
                key: _loginFormKey,
                autovalidateMode: value,
                child: CustomTextFormField(
                  icon: 'phone',
                  label: 'login.textFieldPhone'.tr(),
                  controller: _phoneNumberController,
                  type: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'login.textFieldRequired'.tr();
                    } else if (value.length < 10) {
                      return 'login.textFieldNotValid'.tr();
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            Selector<LoginProvider, bool>(
              selector: (_, provider) => provider.loginLoading,
              builder: (context, value, child) => value
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : child!,
              child: CustomButton(
                title: 'login.buttonTitle'.tr(),
                onTap: () async {
                  if (validate()) {
                    // context.read<OtpProvider>().startTimer();
                    // Helper.showCustomModalBottomSheet(
                    //   widget: CustomLoginBottomSheetWidget(
                    //       phoneNumber: loginProvider.phoneNumberController.text),
                    // );
                    await loginProvider.loginUser(
                        context: context,
                        phoneNumber: _phoneNumberController.text);
                  }
                },
              ),
            )
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
