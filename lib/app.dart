import 'package:cek_in/utils/routing/router.dart';
import 'package:cek_in/utils/routing/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CekIn',
      onGenerateRoute: AppRouter.i.onGenerateRoute,
      initialRoute: Routes.init,
    );
  }
}
