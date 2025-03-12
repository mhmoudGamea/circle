import 'package:circle/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text_form.dart';

class CustomFirstLastName extends StatelessWidget {
  final TextEditingController firstNameEditingController;
  final TextEditingController lastNameEditingController;
  final String firstNameLabel;
  final String lastNameLabel;
  final String firstNameRequired;
  final String lastNameRequired;
  const CustomFirstLastName(
      {super.key,
      required this.firstNameEditingController,
      required this.lastNameEditingController,
      required this.firstNameLabel,
      required this.lastNameLabel,
      required this.firstNameRequired,
      required this.lastNameRequired});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextForm(
            label: firstNameLabel.tr(),
            controller: firstNameEditingController,
            height: 90.h,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return firstNameRequired.tr();
              }
              return null;
            },
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomTextForm(
            label: lastNameLabel.tr(),
            controller: lastNameEditingController,
            height: 90.h,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return lastNameRequired.tr();
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
