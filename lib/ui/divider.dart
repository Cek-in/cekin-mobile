import 'package:flutter/material.dart';

class CekInDivider extends StatelessWidget {
  const CekInDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(),
    );
  }
}
