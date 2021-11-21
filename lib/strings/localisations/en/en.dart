import '../../abstracts/general.dart';
import '../../abstracts/login.dart';
import '../../abstracts/strings.dart';
import '../../abstracts/validator_strings.dart';
import 'general.dart';
import 'login.dart';
import 'validator_strings.dart';

class StringsEn implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsEn();

  @override
  LoginStringsMixin get login => LoginStringsEn();

  @override
  ValidatorStringsMixin get validatorStrings => ValidatorStringsEn();
}
