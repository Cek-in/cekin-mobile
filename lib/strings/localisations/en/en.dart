import '../../abstracts/general.dart';
import '../../abstracts/login.dart';
import '../../abstracts/sign_up.dart';
import '../../abstracts/strings.dart';
import '../../abstracts/validator.dart';
import 'general.dart';
import 'login.dart';
import 'sign_up.dart';
import 'validator_strings.dart';

class StringsEn implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsEn();

  @override
  LoginStringsMixin get login => LoginStringsEn();

  @override
  ValidatorStringsMixin get validatorStrings => ValidatorStringsEn();

  @override
  SignUpStringsMixin get signUp => SignUpStringsEn();
}
