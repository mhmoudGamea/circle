import 'dart:io';

abstract class ImagePickerService {
  File? get pickedImage;
  Future<void> pickImage();
}
