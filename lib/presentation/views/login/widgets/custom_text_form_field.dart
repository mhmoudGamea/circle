import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/utils/helper.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String icon;
  final bool isUnderline;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType type;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.label,
      required this.icon,
      this.isUnderline = false,
      this.type = TextInputType.text,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      cursorColor: AppColors.primaryColor,
      keyboardType: type,
      inputFormatters: [
        LengthLimitingTextInputFormatter(11),
      ],
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: CustomSvgIcon(assetName: icon, width: 22.w, height: 22.w),
        label: Text(label, style: AppStyles.b14, textAlign: TextAlign.start),
        border: Helper.inputBorder(isUnderline: isUnderline),
        focusedBorder: Helper.inputBorder(isUnderline: isUnderline),
        enabledBorder: Helper.inputBorder(isUnderline: isUnderline),
        errorBorder: Helper.inputBorder(
            borderColor: AppColors.primaryColor, isUnderline: isUnderline),
      ),
    );
  }
}
