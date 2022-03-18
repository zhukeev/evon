import 'package:evon/common/routes.dart';
import 'package:flutter/material.dart';

class PersonalDataScreenNavigator {
  final NavigatorState _navigator;

  PersonalDataScreenNavigator(BuildContext context) : _navigator = Navigator.of(context);

  void navigateToResult() => _navigator.pushNamed(Routes.resultScreen);
}
