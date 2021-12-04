import 'package:intl/intl.dart';

import 'preferences.dart';

class DateFormatter {
  static String toSimpleDate(DateTime date) {
    if (DateTime.now().difference(date).inDays > 1) {
      return DateFormat.yMd(Preferences.i.localePreference).format(date);
    } else {
      return DateFormat.MMMMEEEEd(Preferences.i.localePreference).format(date);
    }
  }

  static String toSimpleHourMinute(DateTime date) =>
      DateFormat.Hm(Preferences.i.localePreference).format(date);
}
