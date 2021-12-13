import 'package:flutter/material.dart';

import '../utils/preferences.dart';
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
      systemOverlayStyle: Preferences.i.selectedTheme.appBarOverlayStyle,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: title != null
            ? Text(title!, style: Theme.of(context).textTheme.headline5)
            : null,
        background: expandedSpace,
        titlePadding: EdgeInsets.only(bottom: 15),
      ),
      actions: actions,
      expandedHeight: 150,
      leading: leading ??
          (Navigator.of(context).canPop() ? const GoBackButton() : null),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      pinned: pinned,
    );
  }
}
