import 'package:flutter/material.dart';

class CekInDivider extends StatelessWidget {
  final EdgeInsets padding;
  const CekInDivider({
    this.padding = const EdgeInsets.all(8.0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        thickness: 1,
      ),
    );
  }
}
