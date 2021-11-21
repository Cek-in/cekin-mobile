import '../../abstracts/general.dart';
import '../../abstracts/login.dart';
import '../../abstracts/sign_up.dart';
import '../../abstracts/strings.dart';
import '../../abstracts/validator.dart';
import 'general.dart';
import 'login.dart';
import 'sign_up.dart';
import 'validator_strings.dart';

class StringsCs implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsCs();

  @override
  LoginStringsMixin get login => LoginStringsCs();

  @override
  ValidatorStringsMixin get validatorStrings => ValidatorStringsCs();

  @override
  SignUpStringsMixin get signUp => SignUpStringsCs();
}
