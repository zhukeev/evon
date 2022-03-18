import 'package:evon/common/dio_instance.dart';
import 'package:evon/common/routes.dart';
import 'package:flutter/material.dart';

void main() {
  DioSettings().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routes,
    );
  }
}
