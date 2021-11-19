import 'package:flutter/material.dart';

import 'utils/routing/router.dart';
import 'utils/routing/routes.dart';

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
