import 'package:evon/modules/main_screen/navigator/main_screen_navigator.dart';
import 'package:evon/modules/main_screen/res/main_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textLabelStyle = Theme.of(context).textTheme.caption;
    final headerLabelStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        title: const Text(MainPageStrings.title),
      ),
      body: ChangeNotifierProvider<MainScreenProvider>(
        create: (context) => MainScreenProvider(
          navigator: MainScreenNavigator(context),
        ),
        child: Consumer<MainScreenProvider>(
          builder: (context, provider, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      MainPageStrings.loan,
                      style: headerLabelStyle,
                    ),
                    Row(
                      children: [
                        Text(
                          MainPageStrings.min + minLoan.toStringAsFixed(2),
                          style: textLabelStyle,
                          textAlign: TextAlign.center,
                        ),
                        Expanded(
                          child: Slider(
                            max: maxLoan,
                            min: minLoan,
                            value: provider.state.loan,
                            activeColor: Colors.blue[200],
                            divisions: maxLoan ~/ divisor,
                            label: provider.state.loanWithCurrency,
                            onChanged: provider.onLoanChanged,
                          ),
                        ),
                        Text(
                          MainPageStrings.max + maxLoan.toStringAsFixed(2),
                          style: textLabelStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      MainPageStrings.period,
                      style: headerLabelStyle,
                    ),
                    const SizedBox(height: 16),
                    ...durations.map(
                      (duration) {
                        final isSelected = provider.state.months == duration;

                        return GestureDetector(
                          onTap: () => provider.onDurationChanged(duration),
                          child: Container(
                            height: 64,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue[100] : Colors.grey[200],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Text(
                              MainPageStrings.month(duration),
                              style: textLabelStyle,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    Text(
                      MainPageStrings.totalPayment + ' ${provider.state.totalPayment}',
                      style: headerLabelStyle,
                    ),
                    const SizedBox(height: 16),
                    CheckboxListTile(
                      title: const Text(MainPageStrings.agreeWithPrivacyPolicy),
                      value: provider.state.agreedWithPrivacyPolicy,
                      onChanged: provider.onAgreedWithPrivacyPolicyChanged,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: provider.state.agreedWithPrivacyPolicy ? () => provider.onContinuePressed() : null,
                        child: const Text(MainPageStrings.next),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
