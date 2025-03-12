import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin PickImageMixin on ChangeNotifier {
  // image picker
  final ImagePicker _picker = ImagePicker();

  File? _pickedImage;

  File? get pickedImage => _pickedImage;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _pickedImage = File(image.path);
      notifyListeners();
    }
  }
}
