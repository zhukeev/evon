import 'package:evon/common/constanst.dart';
import 'package:evon/common/interactors/image_picker_interactor.dart';
import 'package:evon/modules/personal_data_screen/navigator/personal_navigator.dart';
import 'package:evon/modules/personal_data_screen/res/personal_data_strings.dart';
import 'package:evon/utils/input_formatters/input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'personal_data_provider.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(PersonalDataStrings.personalData),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PersonalDataProvider(
          navigator: PersonalDataScreenNavigator(context),
          imagePickInteractor: ImagePickInteractor(),
        ),
        child: Consumer<PersonalDataProvider>(
          builder: (ctx, provider, __) {
            var occupationStatusError;
            return GestureDetector(
              onTap: () => FocusScope.of(ctx).unfocus(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: provider.controllers.formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                autofocus: true,
                                controller: provider.controllers.firstNameController,
                                validator: provider.requiredFieldValidator,
                                decoration: InputDecoration(
                                  hintText: PersonalDataStrings.firstNameHint,
                                  labelText: PersonalDataStrings.firstName,
                                ),
                                inputFormatters: EvonInputFormatters.get(
                                  noDigit: true,
                                  isSingleLine: true,
                                ),
                                onEditingComplete: provider.controllers.lastNameFN.requestFocus,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: provider.controllers.lastNameController,
                                validator: provider.requiredFieldValidator,
                                focusNode: provider.controllers.lastNameFN,
                                decoration: InputDecoration(
                                  hintText: PersonalDataStrings.lastNameHint,
                                  labelText: PersonalDataStrings.lastName,
                                ),
                                inputFormatters: EvonInputFormatters.get(
                                  noDigit: true,
                                  isSingleLine: true,
                                ),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          value: provider.occupation,
                          hint: const Text(PersonalDataStrings.occupationStatus),
                          validator: (value) =>
                              value == null ? PersonalDataStrings.occupationStatusValidationError : null,
                          items: [PersonalDataStrings.employed, PersonalDataStrings.unemployed]
                              .map((options) => DropdownMenuItem<String>(
                                    value: options,
                                    child: Text(options),
                                  ))
                              .toList(),
                          onChanged: provider.onOccupationChanged,
                        ),
                        AnimatedSwitcher(
                          duration: AppConstants.milliseconds300,
                          child: provider.isEmployed
                              ? Column(
                                  children: [
                                    TextFormField(
                                      controller: provider.controllers.jobTitleController,
                                      validator: provider.requiredFieldValidator,
                                      decoration: InputDecoration(
                                        hintText: PersonalDataStrings.jobTitleHint,
                                        labelText: PersonalDataStrings.jobTitle,
                                      ),
                                      inputFormatters: EvonInputFormatters.get(
                                        noDigit: true,
                                        isSingleLine: true,
                                      ),
                                      onEditingComplete: provider.controllers.incomeFN.requestFocus,
                                      textInputAction: TextInputAction.next,
                                    ),
                                    TextFormField(
                                      controller: provider.controllers.incomeController,
                                      validator: provider.requiredFieldValidator,
                                      focusNode: provider.controllers.incomeFN,
                                      keyboardType: const TextInputType.numberWithOptions(),
                                      decoration: InputDecoration(
                                        hintText: PersonalDataStrings.monthlyIncomeHint,
                                        labelText: PersonalDataStrings.monthlyIncome,
                                      ),
                                      inputFormatters: EvonInputFormatters.get(
                                        limit: 7,
                                        isSingleLine: true,
                                        digitOnly: true,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: provider.onPickImagePressed,
                                        child: const Text(PersonalDataStrings.pickImage),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    if (provider.image != null)
                                      Image.file(
                                        provider.image!,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: provider.goToResultScreen,
                            child: const Text(PersonalDataStrings.next),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
