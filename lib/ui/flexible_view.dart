import 'package:flutter/material.dart';

class FlexibleView extends StatelessWidget {
  final Widget child;
  final ScrollPhysics? physics;
  const FlexibleView({
    required this.child,
    this.physics,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: physics,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
