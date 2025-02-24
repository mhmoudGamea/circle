import 'package:circle/core/app_theme/app_colors.dart';
import 'package:circle/core/config/app_styles.dart';
import 'package:circle/core/extensions/num_extensions.dart';
import 'package:circle/presentation/widgets/custom_bordered_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/signup/signup_provider.dart';

class CustomEnvitedByUser extends StatelessWidget {
  const CustomEnvitedByUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (_, provider, child) => InkWell(
        onTap: () {
          provider.changeInvitedByUser();
        },
        child: Row(
          spacing: 10,
          children: [
            CustomBorderedContainer(
              width: 24.w,
              height: 24.w,
              padding: 0,
              borderWidth: 1.5,
              bg: provider.invitedByUser
                  ? AppColors.primaryColor
                  : Colors.transparent,
              child: provider.invitedByUser
                  ? Icon(Icons.check_rounded, size: 20, color: AppColors.white)
                  : SizedBox(),
            ),
            child!,
          ],
        ),
      ),
      child: Text('signup.checkBox'.tr(), style: AppStyles.b14),
    );
  }
}
