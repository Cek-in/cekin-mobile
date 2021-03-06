import '../../abstracts/sign_up.dart';

class SignUpStringsEn with SignUpStringsMixin {
  @override
  String get appBarTitle => 'Sign up';

  @override
  String get passwordConfirmLabel => 'Confirm password';

  @override
  String get passwordLabel => 'Password';

  @override
  String get emailLabel => 'Email';

  @override
  String get continueDialogButton => 'Continue';

  @override
  String get firstName => 'Given name';

  @override
  String get lastName => 'Family name';

  @override
  String get failTitle => 'We are sorry';

  @override
  String get failedCreateUser => 'We could not create a new user';

  @override
  String get successContent => 'Please, verify your email address using link '
      'sent to your email.\nDo not forget to check your spam folder.';

  @override
  String get successTitle => 'Success';

  @override
  String get userExists => 'User already exists';

  @override
  String get weakPassword => 'Password is too weak';

  @override
  String get btSubmit => 'Register';
}
