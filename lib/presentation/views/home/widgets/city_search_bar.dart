import 'package:circle/core/extensions/num_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../widgets/custom_drop_down_container.dart';
import '../../../widgets/custom_svg_icon.dart';
import '../../../widgets/custom_text_form.dart';
import '../../signup/widgets/drop_down_city_button.dart';

class CitySearchBar extends StatelessWidget {
  const CitySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CustomDropDownContainer(
          width: 135,
          height: 70.h,
          backgroundColor: AppColors.primaryColor,
          dropDown: DropDownCityButton(
            prefixIconName: 'place_mark',
            prefixIconSize: 24.w,
            iconSize: 21,
            dropDownColor: AppColors.primaryColor,
          ),
        ),
        Expanded(
          child: CustomTextForm(
            controller: TextEditingController(),
            height: 70.h,
            hint: 'home.searchField'.tr(),
            prefix: CustomSvgIcon(assetName: 'search', width: 20, height: 20),
            isFill: true,
            fillColor: AppColors.inputBackground,
          ),
        ),
      ],
    );
  }
}
