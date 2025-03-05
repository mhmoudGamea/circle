import 'package:circle/core/config/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../providers/login/login_provider.dart';

class DropDownCountryButton extends StatelessWidget {
  const DropDownCountryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return DropdownButton(
          value: provider.newFlag.values.first,
          underline: SizedBox(),
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.primaryColor,
          ),
          items: provider.flags
              .map(
                (element) => DropdownMenuItem(
                  value: element.values.first,
                  child: Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset(element['flag']!, height: 32),
                      Text(element.values.first, style: AppStyles.b14),
                    ],
                  ),
                ),
              )
              .toList(), // Align the selected value to the start
          onChanged: (value) {
            provider.changeFlag(value!);
          },
        );
      },
    );
  }
}
