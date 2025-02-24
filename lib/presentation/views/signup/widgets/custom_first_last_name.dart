import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/signup/signup_provider.dart';
import '../../../widgets/custom_text_form.dart';

class CustomFirstLastName extends StatelessWidget {
  const CustomFirstLastName({super.key});

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    return Form(
      key: signupProvider.formKey,
      autovalidateMode: signupProvider.autovalidateMode,
      child: Row(
        children: [
          Expanded(
            child: CustomTextForm(
              label: 'signup.textFieldFirstName',
              controller: signupProvider.firstNameEditingController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'signup.textFieldRequired'.tr();
                }
                return null;
              },
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: CustomTextForm(
              label: 'signup.textFieldLastName',
              controller: signupProvider.lastNameEditingController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'signup.textFieldRequired'.tr();
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
