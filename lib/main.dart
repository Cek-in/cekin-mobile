import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'auth/auth.dart';
import 'utils/preferences.dart';
import 'utils/themes/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Services must be initialised in following order
  await Preferences.i.init();
  await ThemeManager.i.init();
  await Auth.i.init();

  runApp(const MyApp());
}
