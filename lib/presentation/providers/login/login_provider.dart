import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/navigator/navigator.dart';
import '../../../core/services/prefs.dart';
import '../../../core/utils/helper.dart';
import '../../../data/repositories/login_repository.dart';
import '../../views/main/main_view.dart';
import '../../views/signup/signup_view.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository loginRepository;
  LoginProvider(this.loginRepository);
  // form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final ValueNotifier<AutovalidateMode> _autoValidateModeNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  ValueNotifier<AutovalidateMode> get autovalidateModeNotifier =>
      _autoValidateModeNotifier;

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

  // phone text form field
  final TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController get phoneNumberController => _phoneNumberController;

  // validation
  bool validate() {
    if (_formKey.currentState!.validate() &&
        _phoneNumberController.text.length == 10) {
      _formKey.currentState!.save();
      return true;
    } else {
      _autoValidateModeNotifier.value = AutovalidateMode.always;
      return false;
    }
  }

  bool _loginLoading = false;

  bool get loginLoading => _loginLoading;

  // login user
  Future<void> loginUser({required BuildContext context}) async {
    _loginLoading = true;
    notifyListeners();
    final result = await loginRepository.loginUser(
        phoneCode: _newFlag['phoneCode']!,
        phoneNumber: _phoneNumberController.text);
    result.fold((fail) {
      _loginLoading = false;
      notifyListeners();
      NavigatorHandler.push(SignupView(
        phoneCode: _newFlag['phoneCode']!,
        phone: _phoneNumberController.text,
      ));
      // show error snackbar he need to register
      Helper.errorMessage(context, message: fail.message);
    }, (success) {
      _loginLoading = false;
      notifyListeners();
      Prefs.set(Constants.phoneCode, _newFlag['phoneCode']!);
      Prefs.set(Constants.phoneNumber, _phoneNumberController.text);
      NavigatorHandler.pushReplacement(MainView());
      // show success snackbar
      Helper.errorMessage(context, message: 'Success to login');
    });
  }
}
