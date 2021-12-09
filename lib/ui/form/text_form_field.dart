import 'package:flutter/material.dart';
import '../../utils/color_provider.dart';

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
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        hintStyle: const TextStyle(fontStyle: FontStyle.italic),
        suffixIcon: suffix,
        errorStyle: const TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
}
