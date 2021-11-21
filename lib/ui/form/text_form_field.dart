import 'package:flutter/material.dart';

import '../../utils/validation/validators.dart';

class CekInTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextValidator? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CekInTextFormField({
    Key? key,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
