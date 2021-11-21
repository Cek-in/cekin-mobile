import 'package:flutter/material.dart';

class PlainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const PlainButton({
    required this.label,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.all(5),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
      ),
    );
  }
}
