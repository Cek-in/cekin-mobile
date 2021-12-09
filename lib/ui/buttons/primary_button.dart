import 'package:flutter/material.dart';

import 'leading_align.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final LeadingAlign leadingAlign;
  final Widget? leading;
  final String text;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.leadingAlign = LeadingAlign.left,
    this.onPressed,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leading != null && leadingAlign == LeadingAlign.left)
                  leading!,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (leading != null && leadingAlign == LeadingAlign.right)
                  leading!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
