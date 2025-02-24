import 'package:circle/core/dimens/dimens.dart';
import 'package:circle/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
}
/*
here is my provider => class LoginProvider extends ChangeNotifier { // count down time in otp modal bottom sheet
  int _remainingTime = 15;

  int get remainingTimer => _remainingTime;

  Timer? _timer;

  final bool _showResendCode = false;

  bool get showResendCode => _showResendCode;                        void _runTimer() {
    if (_remainingTime > 0) {
      _timer = Timer(Duration(seconds: 1), () {
        _remainingTime -= 1;
        notifyListeners();
        _runTimer(); // Schedule the timer again
      });
    }
  }

  void startTimer() {
    _remainingTime = 15;
    notifyListeners();
    _runTimer();
  }

  void _dispose() {
    _timer!.cancel();
  }} => here is my Row => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: loginProvider.showResendCode,
              child: Text(
                'otp.resendOtp'.tr(),
                style: AppStyles.b14.copyWith(color: AppColors.primaryColor),
              ),
            ),
            Selector<LoginProvider, int>(
              selector: (context, provider) => provider.remainingTimer,
              builder: (_, value, child) => value == 0
                  ? SizedBox()
                  : Text(
                      '00:${value.toString().padLeft(2, '0')}',
                      style: AppStyles.b14.copyWith(color: Color(0xff1F1F1F)),
                    ),
            ),
          ],
        ), => here is my showmodalbottomsheet method i should call it when user enter his number so then he could enter his otp*/
