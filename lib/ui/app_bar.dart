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
      leading: IconButton(
        icon: Icon(Icons.logout),
        onPressed: () {
          Auth.i.logout();
        },
      ),
      systemOverlayStyle: Preferences.i.selectedTheme.appBarOverlayStyle,
    );
  }
}
