import 'check_in_details.dart';
import 'general.dart';
import 'home.dart';
import 'landing.dart';
import 'login.dart';
import 'qr_scan.dart';
import 'sign_up.dart';
import 'validator.dart';

abstract class CekInStrings {
  GeneralStringsMixin get general;
  LoginStringsMixin get login;
  ValidatorStringsMixin get validatorStrings;
  SignUpStringsMixin get signUp;
  QRScanStringsMixin get qrScan;
  HomeStringsMixin get home;
  CheckInDetailsStringsMixin get checkInDetails;
  LandingStringsMixin get landing;
}
