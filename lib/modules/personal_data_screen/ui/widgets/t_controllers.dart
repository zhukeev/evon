import 'package:flutter/material.dart';

class PersonalDataScreenControllers {
  PersonalDataScreenControllers();
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final incomeController = TextEditingController();

  final lastNameFN = FocusNode();
  final incomeFN = FocusNode();

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    jobTitleController.dispose();
    incomeController.dispose();

    lastNameFN.dispose();
    incomeFN.dispose();
  }
}
