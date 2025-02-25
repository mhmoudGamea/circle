import 'package:circle/core/config/app_styles.dart';
import 'package:circle/presentation/providers/home/home_provider.dart';
// import 'package:circle/presentation/providers/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';

class DropDownCityButton extends StatelessWidget {
  const DropDownCityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, provider, child) => Row(
        spacing: 10,
        children: [
          child!,
          Expanded(
            child: DropdownButton(
              value: provider.newCity,
              underline: SizedBox(),
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.white,
                size: 22,
              ),
              items: provider.cities
                  .map(
                    (city) => DropdownMenuItem(
                      value: city,
                      child: Text(
                        city,
                        style: AppStyles.b14.copyWith(color: AppColors.white),
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
      child: SvgPicture.asset('assets/images/svg/place_mark.svg', height: 20),
    );
  }
}
