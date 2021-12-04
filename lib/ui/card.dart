import 'package:flutter/material.dart';

class CekInCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final bool shadow;
  final VoidCallback? onTap;

  const CekInCard({
    required this.child,
    this.radius = 12,
    this.shadow = true,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white),
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          focusColor: Theme.of(context).cardColor,
          splashColor: Theme.of(context).colorScheme.primary,
          child: child,
          onTap: onTap,
        ),
      ),
    );
  }
}
