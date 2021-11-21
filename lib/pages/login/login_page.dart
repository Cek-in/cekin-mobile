import 'package:flutter/material.dart';

import '../../strings/strings_provider.dart';
import '../../ui/flexible_view.dart';
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
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FlexibleView(
      child: Column(
        children: [
          ...buildForm(),
          buildSubmit(),
        ],
      ),
    );
  }

  List<Widget> buildForm() {
    return [
      TextFormField(),
      TextFormField(),
    ];
  }

  Widget buildSubmit() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(s.submitButton),
    );
  }
}
