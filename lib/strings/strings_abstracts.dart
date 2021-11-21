abstract class CekInStrings {
  GeneralStringsMixin get general;
  LoginStringsMixin get login;
}

mixin GeneralStringsMixin {
  String get appName;
}

mixin LoginStringsMixin {
  String get appBarTitle;
}
