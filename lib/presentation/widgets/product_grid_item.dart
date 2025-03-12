import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/data/models/home/latest_products/product_model.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:circle/presentation/widgets/custom_fav_icon.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/utils/helper.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductGridItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
      borderColor: AppColors.inputBorderColor,
      borderRadius: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: productModel.image,
                  placeholder: (context, url) => Helper.shimmerLoading(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFavIcon(onTap: () {}),
                  if (productModel.isOffer)
                    CustomBorderedContainer(
                      bg: AppColors.primaryColor,
                      borderRadius: 6,
                      width: 40,
                      height: 26,
                      padding: 4,
                      borderColor: Colors.transparent,
                      child: FittedBox(
                        child: Text('% ${productModel.offerValue}',
                            style:
                                AppStyles.b16.copyWith(color: AppColors.white)),
                      ),
                    ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(productModel.title,
              style: AppStyles.r14,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FittedBox(
                  child:
                      Text('${productModel.price} ج.م', style: AppStyles.b14),
                ),
              ),
              if (productModel.price != productModel.oldPrice)
                SizedBox(width: 4),
              if (productModel.price != productModel.oldPrice)
                Flexible(
                  child: FittedBox(
                    child: Text(
                      '${productModel.oldPrice} ج.م',
                      style: AppStyles.b12.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.favIconColor),
                    ),
                  ),
                ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primaryColor,
                child: CustomSvgIcon(
                    assetName: 'shopping_cart', width: 27.w, height: 27.w),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
