import 'package:cek_in/ui/flexible_view.dart';
import 'package:flutter/material.dart';

import 'sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  final SignUpBloc bloc;
  const SignUpPage(this.bloc, {Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FlexibleView(
      child: Form(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
