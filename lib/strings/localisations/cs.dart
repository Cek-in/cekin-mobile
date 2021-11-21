import '../strings_abstracts.dart';

class StringsCs implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsCs();
}

class GeneralStringsCs with GeneralStringsMixin {}
