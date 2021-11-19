import 'package:cek_in/utils/preferences.dart';
import 'package:cek_in/utils/themes/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Preferences.i.init();
  await ThemeManager.i.init();

  runApp(const MyApp());
}
