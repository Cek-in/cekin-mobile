import '../../abstracts/login.dart';

class LoginStringsEn with LoginStringsMixin {
  @override
  String get appBarTitle => 'Login';

  @override
  String get submitButton => 'Log In';

  @override
  String get incorrectCredentials => 'Check your login details and try again';

  @override
  String get continueDialogButton => 'Continue';

  @override
  String get failureMessage => 'Something went wrong, please try again later';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get forgotPasswordButton => 'Forgot password';

  @override
  String get signUpButton => 'Sign up';
}
