import 'package:flutter/material.dart';

class TitledTextField extends StatelessWidget {
  const TitledTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter your name',
      ),
    );
  }
}
