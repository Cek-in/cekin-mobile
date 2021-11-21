import '../../abstracts/login.dart';

class LoginStringsCs with LoginStringsMixin {
  @override
  String get appBarTitle => 'Přihlášení';

  @override
  String get submitButton => 'Přihlásit';

  @override
  String get incorrectCredentials => 'Zkontrolujte zadané údaje a zkuste to '
      'znovu';

  @override
  String get continueDialogButton => 'OK';

  @override
  String get failureMessage => 'Něco se nezdařilo, zkuste to znovu později';
}
