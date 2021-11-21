import '../../abstracts/general.dart';
import '../../abstracts/login.dart';
import '../../abstracts/strings.dart';
import 'general.dart';
import 'login.dart';

class StringsCs implements CekInStrings {
  @override
  GeneralStringsMixin get general => GeneralStringsCs();

  @override
  LoginStringsMixin get login => LoginStringsCs();
}
