import 'package:circle/data/models/home/latest_products/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/dimens/dimens.dart';
import 'custom_price_add_cart_button.dart';
import 'custom_product_details.dart';
import 'custom_product_image.dart';

class DetailsViewBody extends StatelessWidget {
  final ProductModel productModel;
  const DetailsViewBody({super.key, required this.productModel});

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
                    child: CustomProductImage(image: productModel.image)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h),
                  child: CustomProductDetails(productModel: productModel),
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
