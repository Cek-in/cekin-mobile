import '../../abstracts/validator_strings.dart';

class ValidatorStringsCs with ValidatorStringsMixin {
  @override
  String get empty => 'Prosíme, vyplňte toto pole';

  @override
  String get emailInvalid => 'Toto není validní emailová adresa';
}
