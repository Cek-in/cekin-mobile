import '../../abstracts/home.dart';

class HomeStringsCs with HomeStringsMixin {
  @override
  String get btScanDialogContinue => 'Pokračovat';

  @override
  String get scanDialogFail => 'Zkuste to prosím později';

  @override
  String get scanDialogFailureTitle => 'Něco se nepovedlo';

  @override
  String get scanDialogInvalidFormat => 'Špatný formát QR kódu. Zkuste to '
      'prosím znovu. Pokud problém přetrvává, kontaktujte podporu.';

  @override
  String get scanDialogConfirmTitle => 'Potvrdit vstup?';

  @override
  String get scanDialogConfirmMessage => 'Opravdu si přejete '
      'zaznamenat vstup do tohoto místa?';

  @override
  String get btScanDialogCancel => 'Zrušit';

  @override
  String get btCheckInDialogContinue => 'Pokračovat';

  @override
  String get checkInDialogFail => 'Nepodařilo se nám zaznamenat vstup. Zkuste'
      ' to prosím později';

  @override
  String get checkInDialogFailTitle => 'Něco se nepovedlo';

  @override
  String get checkInDialogSuccess => 'Vstup zaznamenán\nDěkujeme za používání'
      ' aplikace ČekIn';

  @override
  String get checkInDialogSuccessTitle => 'Úspěch';

  @override
  String get getCheckInsFailMessage => 'Omlouváme se,\nnepodařilo se nám '
      'načíst vaše záznamy.\nZkuste to prosím později.';

  @override
  String get getCheckInsFailTitle => 'Detaily:';

  @override
  String get getCheckInsFailNoCodeGiven => 'Žádný chybový kód';
}
