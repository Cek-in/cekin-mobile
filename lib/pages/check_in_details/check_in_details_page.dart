import 'package:flutter/material.dart';

import '../../strings/strings_provider.dart';
import '../../ui/flexible_view.dart';
import '../../ui/sliver_app_bar.dart';
import 'check_in_details_bloc.dart';

class CheckInDetailsPage extends StatelessWidget {
  final CheckInDetailsBloc _bloc;

  const CheckInDetailsPage(this._bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, b) => buildHeader(context),
        body: buildBody(),
      ),
    );
  }

  List<Widget> buildHeader(BuildContext context) {
    final s = StringsProvider.i.strings.checkInDetails;
    return [
      CekInSliverAppBar(
        title: s.title,
        expandedSpace: Hero(
          child: Center(
            child: Text(
              _bloc.checkIn.place.name,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
          tag: _bloc.checkIn.id,
        ),
      )
    ];
  }

  Widget buildBody() {
    return FlexibleView(
      child: Container(),
    );
  }
}
