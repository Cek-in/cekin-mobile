import 'general.dart';
import 'login.dart';
import 'sign_up.dart';
import 'validator.dart';

abstract class CekInStrings {
  GeneralStringsMixin get general;
  LoginStringsMixin get login;
  ValidatorStringsMixin get validatorStrings;
  SignUpStringsMixin get signUp;
}
