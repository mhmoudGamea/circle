import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/dimens/dimens.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../app_theme/app_colors.dart';
import '../services/responsive_service.dart';

abstract class Helper {
  Helper._();

  /// methos to change the language
  static changeLanguage({required BuildContext context}) {
    if (context.locale.languageCode == 'en') {
      context.setLocale(Locale('ar'));
    } else {
      context.setLocale(Locale('en'));
    }
  }

  /// methos to get the [InputBorder] of the textFormField
  static InputBorder inputBorder(
      {double? borderWidth, Color? borderColor, required bool isUnderline}) {
    return isUnderline
        ? UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? AppColors.inputBorderColor,
            ),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? AppColors.inputBorderColor,
            ),
          );
  }

  /// show modalBottomSheet
  static void showCustomModalBottomSheet({required Widget widget}) async {
    return await showModalBottomSheet(
      context: navigatorKey.currentContext!,
      // isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      backgroundColor: AppColors.white,
      builder: (_) => SizedBox(
        width: ResponsiveService.fullScreenWidth(),
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.only(
                  right: Dimens.padding_24h,
                  left: Dimens.padding_24h,
                  top: Dimens.padding_36v,
                  bottom: MediaQuery.of(navigatorKey.currentContext!)
                      .viewInsets
                      .bottom,
                ),
                child: widget),
          );
        }),
      ),
    );
  }

  /// method to show a nice shimmer effect on the screen
  static Widget shimmerLoading() => Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: Container(
          color: AppColors.shimmerBaseColor,
        ),
      );

  /// method used to show a success message in the bottom of the screen
  static successMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                color: AppColors.white,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message,
                    style: AppStyles.b14.copyWith(color: AppColors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static errorMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: AppColors.white,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message,
                    style: AppStyles.b14.copyWith(color: AppColors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
