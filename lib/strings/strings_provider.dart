import '../utils/preferences.dart';
import 'localisations/cs.dart';
import 'localisations/en.dart';
import 'strings_abstracts.dart';

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
