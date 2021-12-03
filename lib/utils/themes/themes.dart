import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  static final lightTheme = CekInTheme(
      'light',
      ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xff70c041),
          primaryVariant: Color(0xff70c041),
          secondary: Color(0xfff5ffef),
          secondaryVariant: Color(0xfff5ffef),
          surface: Color(0xff70c041),
          background: Color(0xfff5ffef),
          error: Colors.red,
          onPrimary: Color(0xfff5ffef),
          onSecondary: Color(0xff70c041),
          onSurface: Color(0xff70c041),
          onBackground: Color(0xff70c041),
          onError: Color(0xfff5ffef),
          brightness: Brightness.light,
        ),
      ),
      SystemUiOverlayStyle.dark);
  static final darkTheme =
      CekInTheme('dark', ThemeData(), SystemUiOverlayStyle.dark);
}

class ThemeNotDefinedException implements Exception {}
