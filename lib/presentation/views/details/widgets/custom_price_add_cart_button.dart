import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/widgets/custom_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import 'custom_price_currency.dart';

class CustomPriceAddCartButton extends StatelessWidget {
  const CustomPriceAddCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
              color: Color(0x26000000), offset: Offset(0, -2), blurRadius: 24),
        ],
      ),
      child: Row(
        children: [
          Text(
            '${'details.total'.tr()} :',
          ),
          SizedBox(width: 10),
          CustomPriceCurrency(
            priceColor: AppColors.dark,
            currencyColor: AppColors.dark,
          ),
          Spacer(),
          CustomIconButton(
            onTap: () {},
            borderRadius: 16,
            width: 150,
            height: 56,
            title: 'details.basketButton'.tr(),
            icon: 'shopping_cart0',
            backgroungColor: AppColors.primaryColor,
            borderColor: Colors.transparent,
            titleColor: AppColors.white,
          )
        ],
      ),
    );
  }
}
