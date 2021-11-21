import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final Stream<bool> isLoading;
  const LoadingOverlay({
    required this.child,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isLoading,
      builder: (context, snapshot) {
        final ignore = snapshot.data ?? false;
        return Stack(
          children: [
            Opacity(
              opacity: ignore ? 0.5 : 1,
              child: IgnorePointer(
                ignoring: ignore,
                child: child,
              ),
            ),
            if (ignore)
              const Center(
                child: CircularProgressIndicator(),
              )
          ],
        );
      },
    );
  }
}
