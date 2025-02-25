import 'dart:io';

import 'package:circle/core/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupProvider extends ImagePickerService with ChangeNotifier {
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
  void validate() {
    if (_formKey.currentState!.validate()) {
    } else {
      _autovalidateMode = AutovalidateMode.always;
    }
  }
}
