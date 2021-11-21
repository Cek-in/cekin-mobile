import '../strings_abstracts.dart';

class StringsCs implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsCs();

  @override
  LoginStringsMixin get login => LoginStringsCs();
}

class GeneralStringsCs with GeneralStringsMixin {
  @override
  String get appName => 'ČekIn';
}

class LoginStringsCs with LoginStringsMixin {
  @override
  String get appBarTitle => 'Přihlášení';
}
