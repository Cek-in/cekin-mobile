import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../utils/action_result.dart';
import '../utils/logger.dart';
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
      if (user == null) {
        AppRouter.i.key.currentState!
            .pushNamedAndRemoveUntil(Routes.login, (route) => false);
      }
    });
  }

  Future<ActionResult<LoginResults, void>> login(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return ActionResult(result: LoginResults.success);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        Log.i.warn('Firebase returned incorrect credentials');
        return ActionResult(
          result: LoginResults.incorrectCredentials,
        );
      } else {
        // TODO: report error
        Log.i.error('Login failed: ${e.toString()}');
      }
    } catch (e) {
      // TODO: report error
      Log.i.error('Login failed: ${e.toString()}');
    }
    return ActionResult(
      result: LoginResults.fail,
    );
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}

enum LoginResults {
  success,
  incorrectCredentials,
  fail,
}
