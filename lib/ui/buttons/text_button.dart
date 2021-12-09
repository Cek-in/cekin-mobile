import 'leading_align.dart';
import 'package:flutter/material.dart';

class PlainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? leading;
  final LeadingAlign leadingAlign;
  final String label;

  const PlainButton({
    required this.label,
    this.leadingAlign = LeadingAlign.left,
    this.onPressed,
    this.leading,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null && leadingAlign == LeadingAlign.left) leading!,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
          if (leading != null && leadingAlign == LeadingAlign.right) leading!,
        ],
      ),
    );
  }
}
