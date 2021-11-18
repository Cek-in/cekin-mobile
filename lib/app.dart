import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CekIn',
      home: const MyHomePage(),
    );
  }
}
