import '../strings_abstracts.dart';

class StringsEn implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsEn();
}

class GeneralStringsEn with GeneralStringsMixin {
  @override
  String get appName => 'CekIn';
}
