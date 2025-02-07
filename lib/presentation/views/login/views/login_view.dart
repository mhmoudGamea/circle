import 'package:circle/core/utils/helper.dart';
import 'package:circle/presentation/widgets/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const rn = '/loginView';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithLeadingAndTitle(
        context: context,
        title: 'login.appBarTitle'.tr(),
      ),
      body: SafeArea(
        child: LoginViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Helper.changeLanguage(context: context),
        child: const Icon(Icons.language),
      ),
    );
  }
}
