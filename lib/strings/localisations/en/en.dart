import '../../abstracts/general.dart';
import '../../abstracts/login.dart';
import '../../abstracts/strings.dart';
import 'general.dart';
import 'login.dart';

class StringsEn implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsEn();

  @override
  LoginStringsMixin get login => LoginStringsEn();
}
