import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/providers/signup/signup_provider.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';

class DropDownCityButton extends StatelessWidget {
  final String prefixIconName;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final Color? titleColor;
  final Color? iconColor;
  final double? iconSize;
  final Color? dropDownColor;

  const DropDownCityButton({
    super.key,
    required this.prefixIconName,
    this.prefixIconColor,
    this.prefixIconSize,
    this.titleColor,
    this.iconColor,
    this.iconSize,
    this.dropDownColor,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (_, provider, child) => Row(
        spacing: 10,
        children: [
          child!,
          Expanded(
            child: DropdownButton(
              value: provider.newCity,
              underline: SizedBox(),
              isExpanded: true,
              dropdownColor: dropDownColor ?? AppColors.white,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: iconColor ?? AppColors.white,
                size: iconSize ?? 22,
              ),
              items: provider.cities
                  .map(
                    (city) => DropdownMenuItem(
                      value: city,
                      child: FittedBox(
                        child: Text(city.tr(),
                            style: AppStyles.b14.copyWith(
                                color: titleColor ?? AppColors.white)),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                provider.changeCity(value!);
              },
            ),
          ),
        ],
      ),
      child: CustomSvgIcon(
        assetName: prefixIconName,
        width: prefixIconSize ?? 22.w,
        height: prefixIconSize ?? 22.w,
        color: prefixIconColor ?? AppColors.white,
      ),
    );
  }
}
