import '../utils/context_provider.dart';
import 'package:flutter/material.dart';

class CekInVerticalDivider extends StatelessWidget {
  const CekInVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      
      child: VerticalDivider(
        color: context.colors.primary,
        thickness: 3,
      ),
    );
  }
}
