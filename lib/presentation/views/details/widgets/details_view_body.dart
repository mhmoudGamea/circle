import 'package:flutter/material.dart';

import '../../../../core/dimens/dimens.dart';
import '../../../../data/models/home/latest_products/latest_products_model.dart';
import 'custom_price_add_cart_button.dart';
import 'custom_product_details.dart';
import 'custom_product_image.dart';

class DetailsViewBody extends StatelessWidget {
  final LatestProductsModel latestProductsModel;
  const DetailsViewBody({super.key, required this.latestProductsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child:
                        CustomProductImage(image: latestProductsModel.image)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
                  child: CustomProductDetails(
                      latestProductsModel: latestProductsModel),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
        CustomPriceAddCartButton(),
      ],
    );
  }
}
