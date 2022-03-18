import 'package:evon/modules/main_screen/ui/main_screen.dart';
import 'package:evon/modules/personal_data_screen/ui/personal_data_screen.dart';
import 'package:evon/modules/result_screen/ui/result_screen.dart';
import 'package:evon/modules/splash_screen/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const personalDataScreen = '/personalDataScreen';
  static const home = '/home';
  static const resultScreen = '/resultScreen';
  static const splashScreen = '/';

  static final Map<String, Widget Function(Object?)> routes = {
    home: (_) => const MyHomePage(),
    personalDataScreen: (data) => const PersonalDataPage(),
    resultScreen: (data) => const ResultPage(),
    splashScreen: (data) => const SplashPage(),
  };
}
