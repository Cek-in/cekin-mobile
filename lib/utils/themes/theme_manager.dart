import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../preferences.dart';
import 'cek_in_theme.dart';
import 'themes.dart';

class ThemeManager {
  static final ThemeManager i = ThemeManager._();

  ThemeManager._();

  Future<void> init() async {
    final window = WidgetsBinding.instance!.window;
    window.onPlatformBrightnessChanged = refreshTheme;
  }

  Future<void> refreshTheme() async {
    bool useSystem = Preferences.i.useSystemTheme;
    if (useSystem) {
      Preferences.i.selectedTheme =
          SchedulerBinding.instance!.window.platformBrightness ==
                  Brightness.light
              ? CekInThemes.lightTheme
              : CekInThemes.darkTheme;
    }
  }

  Future<void> setTheme(CekInTheme theme) async {
    await Preferences.i.setTheme(theme);
    await Preferences.i.setUseSystemTheme(false);
  }

  Future<void> setUseSystemTheme(value) async {
    if (value) {
      await Preferences.i.setUseSystemTheme(true);
      await refreshTheme();
    } else {
      await Preferences.i.setUseSystemTheme(false);
      Preferences.i.selectedTheme = Preferences.i.getTheme();
    }
  }
}
