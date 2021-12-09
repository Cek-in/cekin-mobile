import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'themes/cek_in_theme.dart';
import 'themes/themes.dart';

class Preferences {
  static Preferences i = Preferences._();
  static const localePrefKey = 'cekInLocale';
  static const themePrefKey = 'cekInTheme';
  static const useSystemThemePrefKey = 'useSystemThemePrefKey';

  late SharedPreferences _sharedPreferences;

  late String localePreference;

  late CekInTheme selectedTheme;

  late bool useSystemTheme = true;

  Preferences._();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    localePreference = getLocale();
    useSystemTheme = getUseSystemTheme();
    selectedTheme = getTheme();
  }

  String getLocale() {
    String? locale = _sharedPreferences.getString(localePrefKey);
    return locale ?? Platform.localeName.substring(0, 2);
  }

  Future<void> setLocale(String locale) async {
    await _sharedPreferences.setString(localePrefKey, locale);
    localePreference = locale;
  }

  bool getUseSystemTheme() {
    bool? useSystemTheme = _sharedPreferences.getBool(useSystemThemePrefKey);
    return useSystemTheme ?? true;
  }

  Future<void> setUseSystemTheme(bool value) async {
    await _sharedPreferences.setBool(useSystemThemePrefKey, value);
    useSystemTheme = value;
  }

  /// Reads selected theme from shared preferences. If null, gets whether use
  /// system theme is true, if so returns system there, if not returns light.
  CekInTheme getTheme() {
    String? theme = _sharedPreferences.getString(themePrefKey);
    theme = 'light';
    // TODO: When dart theme implemented, uncomment this section and remove
    // hardcoded value above.
    // theme ??= useSystemTheme
    //     ? SchedulerBinding.instance!.window.platformBrightness ==
    //             Brightness.light
    //         ? 'light'
    //         : 'dark'
    //     : 'light';
    return CekInThemes.determineThemeFromString(theme);
  }

  Future<void> setTheme(CekInTheme theme) async {
    await _sharedPreferences.setString(themePrefKey, theme.name);
    selectedTheme = theme;
  }
}
