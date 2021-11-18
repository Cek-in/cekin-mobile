import 'package:flutter/material.dart';

import 'init_bloc.dart';

class InitPage extends StatelessWidget {
  final InitPageBloc bloc;
  const InitPage(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
