import 'package:evon/modules/main_screen/navigator/main_screen_navigator.dart';
import 'package:flutter/foundation.dart';

// The value of the initial desired loan.
double get initialLoan => 150;
// The value of the max desired loan.
double get maxLoan => 1000;
// The value of the min desired loan.
double get minLoan => 100;

// Divisions of the slider.
double get divisor => 55;

final durations = [1, 3, 6, 12];

// The state of the main cubit when the desired loan is changed.
class MainScreenState {
  // The new desired loan.
  final double loan;
  // The desired months.
  final int months;

  // The state whether user agrees with pricy policy.
  final bool agreedWithPrivacyPolicy;

  String get loanWithCurrency => '€${loan.toStringAsFixed(0)}';

  String get totalPayment => '€${loan + loan * 0.1 * months}';

  MainScreenState.initial()
      : loan = initialLoan,
        months = durations.first,
        agreedWithPrivacyPolicy = false;

  const MainScreenState({
    required this.loan,
    required this.months,
    this.agreedWithPrivacyPolicy = false,
  });

  MainScreenState copyWith({
    double? loan,
    int? months,
    bool? agreedWithPrivacyPolicy,
  }) =>
      MainScreenState(
        loan: loan ?? this.loan,
        months: months ?? this.months,
        agreedWithPrivacyPolicy: agreedWithPrivacyPolicy ?? this.agreedWithPrivacyPolicy,
      );

  @override
  String toString() =>
      'MainScreenStateChanged { loan: $loan months: $months agreedWithPrivacyPolicy: $agreedWithPrivacyPolicy }';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainScreenState &&
          runtimeType == other.runtimeType &&
          loan == other.loan &&
          months == other.months &&
          agreedWithPrivacyPolicy == other.agreedWithPrivacyPolicy;

  @override
  int get hashCode => loan.hashCode ^ months.hashCode ^ agreedWithPrivacyPolicy.hashCode;
}

class MainScreenProvider extends ChangeNotifier {
  final MainScreenNavigator _navigator;
  MainScreenProvider({required MainScreenNavigator navigator}) : _navigator = navigator;

  MainScreenState _state = MainScreenState.initial();

  MainScreenState get state => _state;

  set state(MainScreenState newState) {
    _state = newState;
    notifyListeners();
  }

  // Handles the desired loan change.
  void onLoanChanged(double loan) => state = state.copyWith(loan: loan);

  // Handles the desired duration change.
  void onDurationChanged(int months) => state = state.copyWith(months: months);

  // Handles if user agrees with privacy policy.
  void onAgreedWithPrivacyPolicyChanged(bool? value) => state = state.copyWith(agreedWithPrivacyPolicy: value ?? false);

  void onContinuePressed() => _navigator.navigateToPersonalDataScreen();
}
