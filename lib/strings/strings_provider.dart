import '../utils/preferences.dart';
import 'abstracts/strings.dart';
import 'localisations/cs/cs.dart';
import 'localisations/en/en.dart';

class StringsProvider {
  static StringsProvider i = StringsProvider._();

  StringsProvider._();

  CekInStrings get strings {
    switch (Preferences.i.localePreference) {
      case 'cs':
        return StringsCs();
      case 'en':
      default:
        return StringsEn();
    }
  }
}
