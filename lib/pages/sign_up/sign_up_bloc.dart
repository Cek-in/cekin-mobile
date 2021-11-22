import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../auth/auth.dart';
import '../../external/graphql_provider.dart';
import '../../external/mutations.dart';
import '../../strings/strings_provider.dart';

class SignUpBloc {
  final StreamController<bool> _isLoadingController =
      StreamController.broadcast();

  SignUpBloc();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  final s = StringsProvider.i.strings.signUp;

  Future<String?> submit(
    String email,
    String password,
    String fName,
    String lName,
  ) async {
    _isLoadingController.add(true);
    final res = await Auth.i.register(email, password);
    _isLoadingController.add(false);
    switch (res.result) {
      case SignUpResults.success:
        final result = await _createUser(fName, lName);
        _isLoadingController.add(false);
        if (result) {
          return null;
        }
        await Auth.i.logout();
        return s.failedCreateUser;
      case SignUpResults.weakPassword:
        _isLoadingController.add(false);
        await Auth.i.logout();
        return s.weakPassword;
      case SignUpResults.userExists:
        _isLoadingController.add(false);
        await Auth.i.logout();
        return s.userExists;
      case SignUpResults.fail:
        _isLoadingController.add(false);
        await Auth.i.logout();
        return s.failedCreateUser;
    }
  }

  Future<bool> _createUser(fName, lName) async {
    final res = await GQLProvider.i.client!.value.mutate(
      MutationOptions(
        document: gql(Mutations.createUser),
        variables: {
          'user': {
            'firstName': fName,
            'lastName': lName,
          },
        },
      ),
    );
    if (res.hasException) {
      return false;
    }
    return true;
  }
}
