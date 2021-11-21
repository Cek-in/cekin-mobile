import '../../abstracts/validator_strings.dart';

class ValidatorStringsEn with ValidatorStringsMixin {
  @override
  String get empty => 'Please, fill in this field';

  @override
  String get emailInvalid => 'Invalid email format';
}
