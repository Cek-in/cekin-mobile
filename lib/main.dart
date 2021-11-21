import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'utils/preferences.dart';
import 'utils/themes/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Preferences.i.init();
  await ThemeManager.i.init();

  runApp(const MyApp());
}
