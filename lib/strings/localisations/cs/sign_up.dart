import '../../abstracts/sign_up.dart';

class SignUpStringsCs with SignUpStringsMixin {
  @override
  String get appBarTitle => 'Registrace';

  @override
  String get passwordConfirmLabel => 'Potvrzení hesla';

  @override
  String get passwordLabel => 'Heslo';

  @override
  String get emailLabel => 'Email';

  @override
  String get continueDialogButton => 'Pokračovat';

  @override
  String get firstName => 'Jméno';

  @override
  String get lastName => 'Příjmení';

  @override
  String get failedCreateUser => 'Nepodařilo se nám vytvořit uživatele';

  @override
  String get userExists => 'Uživatel s tímto emailem již existuje';

  @override
  String get weakPassword => 'Příliš slabé heslo';

  @override
  String get failTitle => 'Chyba';

  @override
  String get successContent => 'Uživatel zaregistrován';

  @override
  String get successTitle => 'Úspěch';
}
