import 'package:circle/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import 'widgets/custom_contact_form.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'contact_us.appBarTitle'.tr(),
        showToolBar: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.border),
        child: CustomContactForm(),
      ),
    );
  }
}
