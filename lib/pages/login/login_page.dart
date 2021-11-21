import 'package:flutter/material.dart';

import '../../strings/strings_provider.dart';
import 'login_bloc.dart';

class LoginPage extends StatelessWidget {
  final LoginPageBloc bloc;
  LoginPage(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  final s = StringsProvider.i.strings.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(s.appBarTitle),
      ),
    );
  }
}
