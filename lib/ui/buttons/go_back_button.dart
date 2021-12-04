import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
