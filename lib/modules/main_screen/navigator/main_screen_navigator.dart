import 'package:evon/common/routes.dart';
import 'package:flutter/material.dart';

class MainScreenNavigator {
  final NavigatorState _navigator;

  MainScreenNavigator(BuildContext context) : _navigator = Navigator.of(context);

  void navigateToPersonalDataScreen() {
    _navigator.pushNamed(Routes.personalDataScreen);
  }
}
