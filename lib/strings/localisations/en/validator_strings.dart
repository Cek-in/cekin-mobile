import '../../abstracts/validator.dart';

class ValidatorStringsEn with ValidatorStringsMixin {
  @override
  String get empty => 'Please, fill in this field';

  @override
  String get emailInvalid => 'Invalid email format';

  @override
  String get passwordNotStrongEnough => 'Password is too weak';
}
