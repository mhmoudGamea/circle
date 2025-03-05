import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/services/image_picker_service.dart';
import '../../../core/constants/constants.dart';
import '../../../core/models/base_sigup_model.dart';
import '../../../core/navigator/navigator.dart';
import '../../../core/services/prefs.dart';
import '../../../core/utils/helper.dart';
import '../../../data/repositories/signup_repository.dart';
import '../../views/login/login_view.dart';

class SignupProvider extends ImagePickerService with ChangeNotifier {
  final SignupRepository signupRepository;

  SignupProvider(this.signupRepository);
  // form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  // image picker
  final ImagePicker _picker = ImagePicker();

  File? _pickedImage;

  @override
  File? get pickedImage => _pickedImage;

  @override
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _pickedImage = File(image.path);
      notifyListeners();
    }
  }

  // first name controller

  final TextEditingController _firstNameEditingController =
      TextEditingController();

  TextEditingController get firstNameEditingController =>
      _firstNameEditingController;
  // last name controller

  final TextEditingController _lastNameEditingController =
      TextEditingController();

  TextEditingController get lastNameEditingController =>
      _lastNameEditingController;

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

  // validate
  bool validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    } else {
      _autovalidateMode = AutovalidateMode.always;
      return false;
    }
  }

  bool _loginLoading = false;

  bool get loginLoading => _loginLoading;

  // signup user
  Future<void> signupUser(
      {required BuildContext context,
      required String phone,
      required String phoneCode}) async {
    _loginLoading = true;
    notifyListeners();
    BaseSignupModel baseSignupModel = BaseSignupModel(
      firstName: _firstNameEditingController.text,
      lastName: _lastNameEditingController.text,
      phoneNumber: phone,
      phoneCode: phoneCode,
      cityId: '1',
    );
    final result =
        await signupRepository.signupUser(baseSignupModel: baseSignupModel);
    result.fold((fail) {
      _loginLoading = false;
      notifyListeners();
      // show error snackbar he need to register
      Helper.errorMessage(context, message: fail.message);
    }, (success) {
      _loginLoading = false;
      notifyListeners();
      Prefs.set(Constants.image, _pickedImage?.path ?? '');
      Prefs.set(Constants.firstName, _firstNameEditingController.text);
      Prefs.set(Constants.lastName, _lastNameEditingController.text);
      NavigatorHandler.push(LoginView());
      // show success snackbar
      Helper.errorMessage(context, message: 'Success to create Account');
    });
  }
}
