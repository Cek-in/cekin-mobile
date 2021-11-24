import 'dart:async';

import '../../auth/auth.dart';
import '../../external/gql_results.dart';
import '../../external/graphql_provider.dart';
import '../../strings/strings_provider.dart';

class SignUpBloc {
  final StreamController<bool> _isLoadingController =
      StreamController.broadcast();

  SignUpBloc();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  final s = StringsProvider.i.strings.signUp;

  Future<String?> submit(
      String email, String password, String fName, String lName) async {
    _isLoadingController.add(true);
    final res = await Auth.i.register(email, password);
    if (res.result == SignUpResults.success) {
      final result = await GQLProvider.i.createUser(fName, lName);
      _isLoadingController.add(false);
      if (result.result == GQLResults.success) {
        return null;
      }
    } else {
      _isLoadingController.add(false);
    }
    await Auth.i.logout();
    switch (res.result) {
      case SignUpResults.weakPassword:
        return s.weakPassword;
      case SignUpResults.userExists:
        return s.userExists;
      case SignUpResults.fail:
      default:
        return s.failedCreateUser;
    }
  }
}
