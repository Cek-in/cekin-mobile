import 'package:cek_in/utils/routing/routes.dart';
import 'package:flutter/material.dart';

import 'init_bloc.dart';

class InitPage extends StatefulWidget {
  final InitPageBloc bloc;
  const InitPage(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();

    widget.bloc.init();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.home, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
