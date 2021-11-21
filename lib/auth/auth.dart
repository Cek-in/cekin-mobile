import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../utils/preferences.dart';
import '../utils/routing/router.dart';
import '../utils/routing/routes.dart';

class Auth {
  static Auth i = Auth._();

  late final FirebaseAuth _auth;
  StreamSubscription<User?>? _authListener;

  Auth._();

  User? get user => _auth.currentUser;

  Future<void> init() async {
    _auth = FirebaseAuth.instance;
    await _auth.setLanguageCode(Preferences.i.localePreference);
  }

  void setAuthListener() {
    _authListener ??= _auth.authStateChanges().listen((user) {
      if (user != null) {
        AppRouter.i.key.currentState!
            .pushNamedAndRemoveUntil(Routes.init, (route) => false);
      } else {
        AppRouter.i.key.currentState!
            .pushNamedAndRemoveUntil(Routes.login, (route) => false);
      }
    });
  }
}
