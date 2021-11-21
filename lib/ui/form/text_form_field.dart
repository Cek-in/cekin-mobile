import 'package:flutter/material.dart';

import '../../utils/validation/validators.dart';

class CekInTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextValidator? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final String? label;
  final Widget? suffix;

  const CekInTextFormField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.validator,
    this.keyboardType,
    this.autofillHints,
    this.label,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
        suffixIcon: suffix,
      ),
    );
  }
}
