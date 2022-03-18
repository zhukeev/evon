import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickInteractor {
  final _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    try {
      final status = await Permission.photos.status;

      if (status.isGranted) {
        final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          return File(pickedFile.path);
        }
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      } else {
        await Permission.photos.request();
      }
    } on Exception catch (e) {
      debugPrint('$e');
      return null;
    }
    return null;
  }
}
