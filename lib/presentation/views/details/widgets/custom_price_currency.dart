import 'package:circle/presentation/providers/details/details_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/app_styles.dart';

class CustomPriceCurrency extends StatelessWidget {
  final String? price;
  final Color priceColor;
  final Color currencyColor;
  const CustomPriceCurrency({
    super.key,
    this.price,
    required this.priceColor,
    required this.currencyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (price != null)
          Text(
            price!,
            style: AppStyles.b18.copyWith(color: priceColor),
          ),
        if (price == null)
          Selector<DetailsProvider, double>(
            selector: (context, provider) => provider.totalPrice,
            builder: (context, value, child) => Text(
              '$value',
              style: AppStyles.b18.copyWith(color: priceColor),
            ),
          ),
        SizedBox(width: 5),
        Text(
          'details.currency'.tr(),
          style: AppStyles.r12.copyWith(color: currencyColor),
        ),
      ],
    );
  }
}
