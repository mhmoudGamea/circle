import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/views/main/main_view.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/services/image_picker_service.dart';
import '../../../core/models/base_sigup_model.dart';
import '../../../core/navigator/navigator.dart';
import '../../../core/services/prefs.dart';
import '../../../core/utils/helper.dart';
import '../../../data/repositories/signup_repository.dart';
import '../mixins/pick_image_mixin.dart';

class SignupProvider extends ImagePickerService
    with ChangeNotifier, PickImageMixin {
  final SignupRepository signupRepository;
  final MainProvider mainProvider;

  SignupProvider(this.signupRepository, this.mainProvider);

  // city drop down menu
  static final List<String> _cities = [
    'dropDownCity.city0',
    'dropDownCity.city1',
    'dropDownCity.city2'
  ];

  List<String> get cities => [..._cities];

  String _newCity = _cities.first;
  String get newCity => _newCity;

  void changeCity(String city) {
    _newCity = city;
    notifyListeners();
  }

  // invited by user
  bool _invitedByUser = false;

  bool get invitedByUser => _invitedByUser;

  void changeInvitedByUser() {
    _invitedByUser = !_invitedByUser;
    notifyListeners();
  }

  bool _signupLoading = false;

  bool get signupLoading => _signupLoading;

  // signup user
  Future<void> signupUser(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String phone,
      required String phoneCode}) async {
    _signupLoading = true;
    notifyListeners();
    BaseSignupModel baseSignupModel = BaseSignupModel(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phone,
      phoneCode: phoneCode,
      cityId: '1',
    );
    final result =
        await signupRepository.signupUser(baseSignupModel: baseSignupModel);
    result.fold((fail) {
      _signupLoading = false;
      notifyListeners();
      // show error snackbar he need to register
      Helper.errorMessage(context, message: fail.message);
    }, (success) async {
      _signupLoading = false;
      notifyListeners();
      await Prefs.set(Constants.phoneCode, phoneCode);
      await Prefs.set(Constants.phoneNumber, phone);
      mainProvider
        ..saveAtSharedPrefs(
          firstName: firstName,
          lastName: lastName,
          image: pickedImage?.path,
        )
        ..loadUserData();

      NavigatorHandler.pushReplacement(MainView());
      // show success snackbar
      Helper.successMessage(context, message: 'تم تسجيل الدخول بنجاح');
    });
  }
}
