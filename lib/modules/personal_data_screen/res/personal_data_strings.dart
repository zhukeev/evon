class PersonalDataStrings {
  static String enterYourHint(String t) => 'Enter your $t';

  static const String personalData = 'Personal Data';
  static const String firstName = 'First name';
  static String firstNameHint = enterYourHint('first name');

  static const String lastName = 'Last name';
  static String lastNameHint = enterYourHint('last name');

  static const String occupationStatus = 'Occupational status';
  static const String employed = 'Employed';
  static const String unemployed = 'Unemployed';
  static const String jobTitle = 'Job title';
  static String jobTitleHint = enterYourHint('job title');

  static const String monthlyIncome = 'Monthly income';
  static String monthlyIncomeHint = enterYourHint('monthly income');

  static const String fieldCantBeEmpty = 'This field can\'t be empty';
  static const String pickImage = 'Pick last invoice image';

  static const String next = 'Continue';
  static const String occupationStatusValidationError = 'Choose occupation status';
}
