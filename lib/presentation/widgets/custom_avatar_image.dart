import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/providers/mixins/pick_image_mixin.dart';
import 'package:circle/presentation/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_theme/app_colors.dart';
import 'custom_bordered_container.dart';
import 'custom_cart_logo.dart';

class CustomAvatarImage<T extends PickImageMixin> extends StatelessWidget {
  final String icon;
  final Color iconBgColor;
  final Alignment iconAlignment;
  final Color avatarBorderColor;
  const CustomAvatarImage({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.iconAlignment,
    required this.avatarBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Consumer<T>(
      builder: (_, provider, child) => CustomBorderedContainer(
          width: mediaQuery.width * 0.3,
          height: mediaQuery.width * 0.3,
          borderRadius: 16.r,
          borderWidth: 1.5,
          borderColor: avatarBorderColor,
          padding: provider.pickedImage != null ? 0 : 3,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (provider.pickedImage == null)
                Positioned(
                  top: 30,
                  right: 20,
                  child: AnimatedScale(
                    scale: 0.7,
                    duration: Duration(seconds: 0),
                    child: CustomCartLogo(
                      lineColor: AppColors.inputBorderColor,
                      cartColor: AppColors.inputBorderColor,
                    ),
                  ),
                ),
              if (provider.pickedImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.file(
                    provider.pickedImage!,
                    fit: BoxFit.cover,
                    //TODO: ask about that
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              Positioned(
                bottom: -10,
                left: -10,
                child: InkWell(
                  onTap: provider.pickImage,
                  child: CustomBorderedContainer(
                    bg: iconBgColor,
                    width: 40,
                    height: 40,
                    padding: 8,
                    borderRadius: 25,
                    borderColor: Colors.transparent,
                    borderWidth: 0,
                    child: CustomSvgIcon(
                      assetName: icon,
                      width: 25.w,
                      height: 25.w,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
