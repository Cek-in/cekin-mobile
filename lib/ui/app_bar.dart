import 'package:flutter/material.dart';

import '../auth/auth.dart';
import '../utils/preferences.dart';

class CekInAppBar {
  static get({
    Key? key,
    Widget? leading,
    Widget? title,
  }) {
    return AppBar(
      title: title,
      leading: leading,
      systemOverlayStyle: Preferences.i.selectedTheme.appBarOverlayStyle,
    );
  }
}
