import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:ui' as ui;

import '../../core/app_theme/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  final int fieldsCount;
  final TextEditingController controller;
  const CustomPinCodeTextField(
      {super.key, required this.fieldsCount, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: PinCodeTextField(
        enableActiveFill: false,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        keyboardType: TextInputType.number,
        autoDisposeControllers: false,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        appContext: context,
        length: fieldsCount,
        cursorColor: AppColors.primaryColor,
        textStyle: AppStyles.b24.copyWith(color: AppColors.primaryColor),
        controller: controller,
        pinTheme: PinTheme(
          fieldHeight: 56.w,
          fieldWidth: 56.w,
          shape: PinCodeFieldShape.underline,
          activeColor: AppColors.inputBorderColor,
          inactiveColor: AppColors.inputBorderColor,
          selectedColor: AppColors.inputBorderColor,
        ),
      ),
    );
  }
}
