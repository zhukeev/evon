class MainPageStrings {
  static const String title = 'Main Page';
  static const String loan = 'Loan:';
  static const String min = 'Min:\n€';
  static const String max = 'Max:\n€';
  static const String period = 'Period:';
  static const String totalPayment = 'Total payment amount:';
  static const String agreeWithPrivacyPolicy = 'I agree with the privacy policy';
  static const String next = 'Continue';

  static String month(int d) => '$d Month${d > 1 ? 's' : ''}';
}
