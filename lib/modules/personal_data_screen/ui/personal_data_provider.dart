import 'dart:io';

import 'package:evon/common/interactors/image_picker_interactor.dart';
import 'package:evon/modules/personal_data_screen/navigator/personal_navigator.dart';
import 'package:evon/modules/personal_data_screen/res/personal_data_strings.dart';
import 'package:evon/modules/personal_data_screen/ui/widgets/t_controllers.dart';
import 'package:flutter/foundation.dart';

class PersonalDataProvider extends ChangeNotifier {
  final PersonalDataScreenNavigator _navigator;
  final ImagePickInteractor _imagePickInteractor;
  final controllers = PersonalDataScreenControllers();

  String? _occupation;

  File? image;

  PersonalDataProvider({
    required ImagePickInteractor imagePickInteractor,
    required PersonalDataScreenNavigator navigator,
  })  : _imagePickInteractor = imagePickInteractor,
        _navigator = navigator;

  String? get occupation => _occupation;

  bool get isEmployed => _occupation != null && occupation == PersonalDataStrings.employed;

  String? requiredFieldValidator(String? text) =>
      text != null && text.isNotEmpty ? null : PersonalDataStrings.fieldCantBeEmpty;

  void onOccupationChanged(String? val) {
    if (occupation != val) {
      _occupation = val;
      notifyListeners();
    }
  }

  void onPickImagePressed() async {
    final file = await _imagePickInteractor.pickImageFromGallery();
    if (file != null) {
      image = file;
      notifyListeners();
    }
  }

  void goToResultScreen() {
    if (controllers.formKey.currentState!.validate()) {
      _navigator.navigateToResult();
    }
  }

  @override
  void dispose() {
    controllers.dispose();
    super.dispose();
  }
}
