import 'package:circle/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/config/app_styles.dart';
import '../../../core/constants/constants.dart';
import '../../widgets/custom_cart_circle_logo.dart';
import 'widgets/custom_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          showToolBar: true,
          showBackArrow: false,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.border),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    CustomCartCircleLogo(),
                    SizedBox(height: 64),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'login.title'.tr(),
                          style: AppStyles.b18
                              .copyWith(fontSize: 28, color: AppColors.gray),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'login.subTitle'.tr(),
                          style: AppStyles.r14.copyWith(color: AppColors.gray),
                        ),
                        SizedBox(height: 24),
                        CustomForm(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child:
                    SvgPicture.asset('assets/images/svg/cart_logo_login.svg')),
          ],
        ));
  }
}
