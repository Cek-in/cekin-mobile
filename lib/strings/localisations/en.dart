import '../strings_abstracts.dart';

class StringsEn implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsEn();

  @override
  LoginStringsMixin get login => LoginStringsEn();
}

class GeneralStringsEn with GeneralStringsMixin {
  @override
  String get appName => 'CekIn';
}

class LoginStringsEn with LoginStringsMixin {
  @override
  String get appBarTitle => 'Login';
}
