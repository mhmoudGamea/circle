import 'package:circle/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_svg_icon.dart';
import '../../login/widgets/custom_text_form_field.dart';

class CustomContactForm extends StatelessWidget {
  const CustomContactForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomSvgIcon(
              assetName: 'contactLogoImage', width: 150.w, height: 150.w),
          SizedBox(height: 48),
          CustomTextFormField(
            icon: 'person',
            label: 'contact_us.textFieldName'.tr(),
            isUnderline: true,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            icon: '@',
            label: 'contact_us.textFieldEmail'.tr(),
            isUnderline: true,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            icon: 'save',
            label: 'contact_us.textFieldMessageAddress'.tr(),
            isUnderline: true,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            icon: 'message',
            label: 'contact_us.textFieldMessage'.tr(),
            isUnderline: true,
            maxLines: 4,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 30),
          CustomButton(title: 'contact_us.buttonTitle'.tr(), onTap: () {}),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
