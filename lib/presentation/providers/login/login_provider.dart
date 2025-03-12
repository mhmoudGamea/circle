import 'package:flutter/material.dart';

import '../../../core/navigator/navigator.dart';
import '../../../core/utils/helper.dart';
import '../../../data/repositories/login_repository.dart';
import '../../views/signup/signup_view.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository loginRepository;
  LoginProvider(this.loginRepository);

  // country text form field
  static final List<Map<String, String>> _flags = [
    {
      'country': 'Egypt',
      'flag': 'assets/images/svg/eg_flag.svg',
      'phoneCode': '+20'
    },
    {
      'country': 'Saudi Arabia',
      'flag': 'assets/images/svg/sa_flag.svg',
      'phoneCode': '+20'
    },
    {
      'country': 'Moroco',
      'flag': 'assets/images/svg/mo_flag.svg',
      'phoneCode': '+20'
    },
  ];

  List<Map<String, String>> get flags => [..._flags];

  Map<String, String> _newFlag = _flags[0];

  Map<String, String> get newFlag => _newFlag;

  void changeFlag(String flag) {
    Map<String, String> flagMap =
        _flags.firstWhere((element) => element['country'] == flag);
    _newFlag = flagMap;
    notifyListeners();
  }

  bool _loginLoading = false;

  bool get loginLoading => _loginLoading;

  // login user
  Future<void> loginUser(
      {required BuildContext context, required String phoneNumber}) async {
    _loginLoading = true;
    notifyListeners();
    final result = await loginRepository.loginUser(
        phoneCode: _newFlag['phoneCode']!, phoneNumber: phoneNumber);
    result.fold((fail) async {
      _loginLoading = false;
      notifyListeners();
      NavigatorHandler.pushReplacement(SignupView(
        phoneCode: _newFlag['phoneCode']!,
        phone: phoneNumber,
      ));
      // show error snackbar he need to register
      Helper.errorMessage(context, message: fail.message);
    }, (success) {
      _loginLoading = false;
      notifyListeners();
    });
  }
}
