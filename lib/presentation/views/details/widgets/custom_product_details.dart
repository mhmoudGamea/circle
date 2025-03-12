import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/data/models/home/latest_products/product_model.dart';
import 'package:circle/presentation/providers/details/details_provider.dart';
import 'package:circle/presentation/views/details/widgets/custom_price_currency.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../widgets/custom_fav_icon.dart';

class CustomProductDetails extends StatelessWidget {
  final ProductModel productModel;
  const CustomProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              productModel.title,
              style: AppStyles.b18.copyWith(color: AppColors.primaryColor),
            ),
            Spacer(),
            CustomFavIcon(
                onTap: () {},
                bg: Colors.transparent,
                iconColor: AppColors.favIconColor),
          ],
        ),
        SizedBox(height: 16),
        Text(
          productModel.details,
          style: AppStyles.b12.copyWith(color: AppColors.gray),
        ),
        SizedBox(height: 12),
        CustomBorderedContainer(
          bg: AppColors.inputBackground,
          borderColor: Colors.transparent,
          borderRadius: 16,
          isExpanded: true,
          child: Column(
            children: [
              CustomBorderedContainer(
                bg: AppColors.white,
                borderRadius: 12,
                child: Row(
                  children: [
                    CustomSvgIcon(assetName: 'price_page'),
                    SizedBox(width: 5),
                    Text(
                      '${'details.price'.tr()} :',
                    ),
                    Spacer(),
                    CustomPriceCurrency(
                      price: productModel.price.toString(),
                      priceColor: AppColors.primaryColor,
                      currencyColor: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                spacing: 16,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<DetailsProvider>()
                          .decreaseQuantity(productModel.price);
                    },
                    child: CustomSvgIcon(
                        assetName: 'decrease', width: 22.w, height: 22.w),
                  ),
                  Flexible(
                    child: CustomBorderedContainer(
                      bg: AppColors.white,
                      borderRadius: 12,
                      child: Selector<DetailsProvider, int>(
                        selector: (context, provider) => provider.quantity,
                        builder: (context, value, child) => Text(
                          '$value',
                          style: AppStyles.b18,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<DetailsProvider>()
                          .increaseQuantity(productModel.price);
                    },
                    child: CustomSvgIcon(
                        assetName: 'increase', width: 22.w, height: 22.w),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
