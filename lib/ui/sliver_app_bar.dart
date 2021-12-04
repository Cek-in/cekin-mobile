import 'package:flutter/material.dart';

import 'buttons/go_back_button.dart';

class CekInSliverAppBar extends StatelessWidget {
  final String? title;
  final Widget expandedSpace;
  final Widget? leading;
  final bool pinned;
  final List<Widget>? actions;

  /// Provides MyCar styled [SliverAppBar] with [FlexibleSpaceBar]. [title] is
  /// the string that is being displayed in the AppBar all the time.
  /// [expandedSpace] is being used as background for flexible space so it's
  /// visible only in expanded state.
  const CekInSliverAppBar({
    required this.expandedSpace,
    this.pinned = true,
    this.title,
    this.leading,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              )
            : null,
        background: expandedSpace,
      ),
      actions: actions,
      expandedHeight: 180,
      leading: leading ??
          (Navigator.of(context).canPop() ? const GoBackButton() : null),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 5,
      forceElevated: true,
      pinned: pinned,
    );
  }
}
