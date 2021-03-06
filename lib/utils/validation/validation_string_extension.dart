extension ValidationStringExtension on String {
  bool isValidEmail() {
    return RegExp(
            r'''^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''')
        .hasMatch(this);
  }

  /// Returns whether the password is strong enough to satisfy current standards
  /// (at least 8 characters, uppercase and lowercase, number and special
  /// character)
  bool isStrongPassword() {
    return RegExp(
            r'''^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$''')
        .hasMatch(this);
  }

  bool isValidCekinQRCode() {
    return RegExp(
            r'''^(cekin):(qr:[0-9]{13}):([A-Za-z0-9]{30}):(\d+\.?\d*):([0-9]{13}):((-|)+\d+\.?\d*)\w$''')
        .hasMatch(this);
  }
}
