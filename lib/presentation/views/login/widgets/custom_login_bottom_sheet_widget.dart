import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/config/app_styles.dart';
import '../../../providers/otp/otp_provider.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_pin_code_field.dart';

class CustomLoginBottomSheetWidget extends StatelessWidget {
  final String phoneNumber;
  const CustomLoginBottomSheetWidget({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OtpProvider>(context);
    return Column(
      children: [
        SvgPicture.asset('assets/images/svg/otp.svg'),
        SizedBox(height: 16),
        Text(
          '${'otp.title'.tr()}\n$phoneNumber',
          style: AppStyles.b14,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        CustomPinCodeTextField(
            fieldsCount: 5, controller: TextEditingController()),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: otpProvider.showResendCode,
              child: InkWell(
                onTap: otpProvider.startTimer,
                child: Text(
                  'otp.resendOtp'.tr(),
                  style: AppStyles.b14.copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
            Selector<OtpProvider, int>(
              selector: (context, provider) => provider.remainingTimer,
              builder: (_, value, child) => value == 0
                  ? SizedBox()
                  : Text(
                      '00:${value.toString().padLeft(2, '0')}',
                      style: AppStyles.b14.copyWith(color: Color(0xff1F1F1F)),
                    ),
            ),
          ],
        ),
        SizedBox(height: 16),
        CustomButton(
          title: 'otp.buttonTitle'.tr(),
          onTap: () {
            // NavigatorHandler.push(SignupView());
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
