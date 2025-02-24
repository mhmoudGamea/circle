import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  // form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final ValueNotifier<AutovalidateMode> _autoValidateModeNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  ValueNotifier<AutovalidateMode> get autovalidateModeNotifier =>
      _autoValidateModeNotifier;

  // country text form field
  static final List<Map<String, String>> _flags = [
    {'country': 'Egypt', 'flag': 'assets/images/svg/eg_flag.svg'},
    {'country': 'Saudi Arabia', 'flag': 'assets/images/svg/sa_flag.svg'},
    {'country': 'Moroco', 'flag': 'assets/images/svg/mo_flag.svg'},
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
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  // validation
  bool validate() {
    if (_formKey.currentState!.validate() && _controller.text.length == 11) {
      _formKey.currentState!.save();
      return true;
    } else {
      _autoValidateModeNotifier.value = AutovalidateMode.always;
      return false;
    }
  }
}
