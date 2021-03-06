import 'package:cek_in/strings/abstracts/check_in_details.dart';
import 'package:cek_in/strings/localisations/cs/check_in_details.dart';

import '../../abstracts/general.dart';
import '../../abstracts/home.dart';
import '../../abstracts/login.dart';
import '../../abstracts/qr_scan.dart';
import '../../abstracts/sign_up.dart';
import '../../abstracts/strings.dart';
import '../../abstracts/validator.dart';
import 'general.dart';
import 'home.dart';
import 'login.dart';
import 'qr_scan.dart';
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

  @override
  QRScanStringsMixin get qrScan => QRScanStringsCs();

  @override
  HomeStringsMixin get home => HomeStringsCs();

  @override
  CheckInDetailsStringsMixin get checkInDetails => CheckInDetailsStringsCs();
}
