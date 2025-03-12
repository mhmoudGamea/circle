import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../providers/modify_account/modify_account_provider.dart';
import '../../../widgets/custom_button.dart';
import '../../signup/widgets/custom_first_last_name.dart';

class ModifyAccountForm extends StatefulWidget {
  const ModifyAccountForm({super.key});

  @override
  State<ModifyAccountForm> createState() => _ModifyAccountFormState();
}

class _ModifyAccountFormState extends State<ModifyAccountForm> {
  // form key
  final GlobalKey<FormState> _modifyAccountFormKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> _modifyAccountAutoValidateModeNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  // first name controller
  final TextEditingController _modifyAccountFirstNameEditingController =
      TextEditingController();
  // last name controller
  final TextEditingController _modifyAccountLastNameEditingController =
      TextEditingController();

  bool validate() {
    if (_modifyAccountFormKey.currentState!.validate()) {
      _modifyAccountFormKey.currentState!.save();
      return true;
    } else {
      _modifyAccountAutoValidateModeNotifier.value = AutovalidateMode.always;
      return false;
    }
  }

  @override
  void dispose() {
    log('dispose of form in modify is called');
    _modifyAccountAutoValidateModeNotifier.dispose();
    _modifyAccountFirstNameEditingController.dispose();
    _modifyAccountLastNameEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modifyAccountProvider =
        Provider.of<ModifyAccountProvider>(context, listen: false);
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: _modifyAccountAutoValidateModeNotifier,
          builder: (context, value, child) => Form(
            key: _modifyAccountFormKey,
            autovalidateMode: value,
            child: CustomFirstLastName(
              firstNameEditingController:
                  _modifyAccountFirstNameEditingController,
              lastNameEditingController:
                  _modifyAccountLastNameEditingController,
              firstNameLabel: 'modify_account.textFieldFirstName',
              lastNameLabel: 'modify_account.textFieldLastName',
              firstNameRequired: 'modify_account.textFieldRequired',
              lastNameRequired: 'modify_account.textFieldRequired',
            ),
          ),
        ),
        Spacer(),
        CustomButton(
          title: 'modify_account.buttonTitle',
          onTap: () async {
            if (validate()) {
              await modifyAccountProvider.saveAtSharedPrefs(
                  firstName: _modifyAccountFirstNameEditingController.text,
                  lastName: _modifyAccountLastNameEditingController.text);
            }
          },
        ),
      ],
    );
  }
}
