import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/core/utils/helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/app_theme/app_colors.dart';
import '../../core/config/app_styles.dart';

class CustomTextForm extends StatelessWidget {
  final String? label;
  final String? hint;
  final double? height;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Widget? suffix;
  final Widget? prefix;
  final Color? bgColor;
  final double? borderRaduis;
  final bool? isFill;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final bool isUnderline;

  const CustomTextForm({
    super.key,
    required this.controller,
    this.height,
    this.label,
    this.hint,
    this.suffix,
    this.prefix,
    this.textInputType,
    this.bgColor,
    this.validator,
    this.borderRaduis,
    this.isFill = false,
    this.fillColor,
    this.isUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRaduis ?? 16.r)),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.primaryColor,
        keyboardType: textInputType ?? TextInputType.text,
        validator: validator,
        decoration: InputDecoration(
          border: Helper.inputBorder(isUnderline: isUnderline),
          enabledBorder: Helper.inputBorder(isUnderline: isUnderline),
          focusedBorder: Helper.inputBorder(isUnderline: isUnderline),
          label: label == null
              ? null
              : Align(
                  alignment: Alignment.center,
                  child: Text(label!.tr(),
                      style: AppStyles.b14, textAlign: TextAlign.center),
                ),
          hintText: hint,
          hintStyle: AppStyles.b13.copyWith(color: AppColors.gray),
          prefixIcon: prefix,
          prefixIconConstraints: BoxConstraints(
            maxHeight: 24.h,
            maxWidth: 96.w,
            minWidth: 45.w,
          ),
          suffixIcon: suffix,
          suffixIconConstraints: BoxConstraints(
            maxHeight: 24.h,
            maxWidth: 96.w,
            minWidth: 45.w,
          ),
          filled: isFill,
          fillColor: fillColor,
        ),
      ),
    );
  }
}
