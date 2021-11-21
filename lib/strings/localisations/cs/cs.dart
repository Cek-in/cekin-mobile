import 'package:cek_in/strings/abstracts/validator_strings.dart';
import 'package:cek_in/strings/localisations/cs/validator_strings.dart';

import '../../abstracts/general.dart';
import '../../abstracts/login.dart';
import '../../abstracts/strings.dart';
import 'general.dart';
import 'login.dart';

class StringsCs implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsCs();

  @override
  LoginStringsMixin get login => LoginStringsCs();

  @override
  ValidatorStringsMixin get validatorStrings => ValidatorStringsCs();
}
