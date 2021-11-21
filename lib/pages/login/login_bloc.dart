import 'dart:async';

import '../../auth/auth.dart';
import '../../strings/strings_provider.dart';

class LoginPageBloc {
  final StreamController<bool> _loadingController =
      StreamController.broadcast();

  LoginPageBloc();

  Stream<bool> get loadingStream => _loadingController.stream;

  Future<String?> submit(String email, String password) async {
    _loadingController.add(true);
    final res = await Auth.i.login(email, password);
    _loadingController.add(false);
    final s = StringsProvider.i.strings.login;
    switch (res.result) {
      case LoginResults.success:
        return null;
      case LoginResults.incorrectCredentials:
        return s.incorrectCredentials;
      case LoginResults.fail:
        return s.failureMessage;
    }
  }
}
