import 'package:circle/core/constants/constants.dart';
import 'package:circle/core/services/prefs.dart';
import 'package:circle/core/utils/helper.dart';
import 'package:circle/data/models/profile/modify_account_model.dart';
import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/modify_account_repository.dart';
import '../../../main.dart';
import '../mixins/pick_image_mixin.dart';

class ModifyAccountProvider with ChangeNotifier, PickImageMixin {
  final ModifyAccountRepository modifyAccountRepository;
  final MainProvider mainProvider;

  ModifyAccountProvider(
      {required this.modifyAccountRepository, required this.mainProvider});

  /// save user data in backend then save it in shared prefs
  Future<void> saveAtSharedPrefs(
      {required String firstName, required String lastName}) async {
    if (Prefs.get(Constants.firstName) != firstName ||
        Prefs.get(Constants.lastName) != lastName) {
      await updateUserData(firstName: firstName, lastName: lastName);
    }
  }

  Future<void> updateUserData(
      {required String firstName, required String lastName}) async {
    ModifyAccountModel model = ModifyAccountModel(
        firstName: firstName,
        lastName: lastName,
        image: pickedImage?.path ?? '');
    final result =
        await modifyAccountRepository.updateUserData(modifyAccountModel: model);
    result.fold(
      (fail) {
        // show error snackbar
        Helper.errorMessage(navigatorKey.currentContext!,
            message: fail.message);
        // return false;
      },
      (success) async {
        // show success snackbar
        Helper.successMessage(navigatorKey.currentContext!,
            message: 'Successfully modify your data');
        await mainProvider.saveAtSharedPrefs(
          firstName: firstName,
          lastName: lastName,
          image: pickedImage?.path,
        );
        mainProvider.loadUserData();
      },
    );
  }
}
