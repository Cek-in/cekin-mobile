import 'package:flutter/material.dart';

extension ColorProvider on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
