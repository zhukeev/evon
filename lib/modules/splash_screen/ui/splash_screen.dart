import 'package:evon/common/constanst.dart';
import 'package:evon/common/routes.dart';
import 'package:evon/modules/splash_screen/res/splash_strings.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(AppConstants.splashDuration, () {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FittedBox(
          child: Text(SplashPageStrings.title, style: Theme.of(context).textTheme.headline1),
        ),
      ),
    ));
  }
}
