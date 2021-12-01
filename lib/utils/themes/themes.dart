import 'package:flutter/material.dart';

import 'cek_in_theme.dart';

class CekInThemes {
  static CekInTheme determineThemeFromString(String theme) {
    switch (theme) {
      case 'light':
        return lightTheme;
      case 'dark':
        return darkTheme;
      default:
        throw ThemeNotDefinedException();
    }
  }

  // TODO: implement themes when provided with design
  static final lightTheme = CekInTheme('light', ThemeData());
  static final darkTheme = CekInTheme('dark', ThemeData());
}

class ThemeNotDefinedException implements Exception {}
