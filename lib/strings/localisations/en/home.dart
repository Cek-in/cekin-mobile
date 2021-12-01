import '../../abstracts/home.dart';

class HomeStringsEn with HomeStringsMixin {
  @override
  String get btScanDialogContinue => 'Continue';

  @override
  String get scanDialogFail => 'Something went wrong';

  @override
  String get scanDialogFailureTitle => 'Please, try again later';

  @override
  String get scanDialogInvalidFormat => 'Could not verify QR code, please try'
      ' again. If the problem persists, contact our support for help';

  @override
  String get scanDialogConfirmMessage => 'Is this place where you '
      'want to check in?';

  @override
  String get scanDialogConfirmTitle => 'Confirm CheckIn?';

  @override
  String get btScanDialogCancel => 'Cancel';

  @override
  String get btCheckInDialogContinue => 'Continue';

  @override
  String get checkInDialogFail => 'Sorry, we could not check you in. Please, '
      'try '
      'again later';

  @override
  String get checkInDialogFailTitle => 'Something went wrong';

  @override
  String get checkInDialogSuccess => 'You just checked in for this place.'
      '\nThank you for using ČekIn app';

  @override
  String get checkInDialogSuccessTitle => 'Success';

  @override
  String get getCheckInsFailMessage => 'We are sorry,\nwe could not fetch '
      'your records.\nPlease, try again later.';

  @override
  String get getCheckInsFailTitle => 'Details:';

  @override
  String get getCheckInsFailNoCodeGiven => 'No error code';
}
