import 'package:cek_in/strings/abstracts/check_in_details.dart';
import 'package:cek_in/strings/abstracts/landing.dart';
import 'package:cek_in/strings/localisations/en/check_in_details.dart';
import 'package:cek_in/strings/localisations/en/landing.dart';

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

class StringsEn implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsEn();

  @override
  LoginStringsMixin get login => LoginStringsEn();

  @override
  ValidatorStringsMixin get validatorStrings => ValidatorStringsEn();

  @override
  SignUpStringsMixin get signUp => SignUpStringsEn();

  @override
  QRScanStringsMixin get qrScan => QRScanStringsEn();

  @override
  HomeStringsMixin get home => HomeStringsEn();

  @override
  CheckInDetailsStringsMixin get checkInDetails => CheckInDetailsStringsEn();

  @override
  LandingStringsMixin get landing => LandingPageStringsEn();
}
