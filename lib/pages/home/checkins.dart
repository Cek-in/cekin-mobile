import '../../ui/vertical_divider.dart';
import '../../utils/context_provider.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../external/graphql_api.dart';
import '../../strings/strings_provider.dart';
import '../../ui/card.dart';
import '../../utils/date_formatter.dart';
import '../../utils/int_extension.dart';
import '../../utils/logger.dart';
import '../../utils/routing/routes.dart';
import '../../utils/types.dart';
import 'home_bloc.dart';

class CheckIns extends StatelessWidget {
  final HomePageBloc _bloc;
  final s = StringsProvider.i.strings.home;
  final DateTime start;
  final DateTime end;
  CheckIns(
    this._bloc, {
    required this.start,
    required this.end,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: GetCheckInsQuery().document,
      ),
      builder: (
        QueryResult result, {
        Future<QueryResult?> Function()? refetch,
        FetchMore? fetchMore,
      }) {
        _bloc.refetchCallback = refetch;
        if (result.hasException) {
          Log.i.error(result.exception.toString());
          return _buildErrorMessage(result.exception, context);
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (result.isLoading) const LinearProgressIndicator(),
            if (result.data != null) _buildCheckInsCards(result.data!, context),
          ],
        );
      },
    );
  }

  Widget _buildCheckInsCards(
    Map<String, dynamic> data,
    BuildContext context,
  ) {
    final checkIns = _bloc.parseData(data);
    if (checkIns.result == CheckInParseResults.success &&
        checkIns.value != null) {
      return Flexible(
        child: GroupedListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          elements: checkIns.value!,
          order: GroupedListOrder.DESC,
          groupComparator: _bloc.checkInGroupComparator,
          itemComparator: _bloc.chekInItemComparator,
          groupHeaderBuilder: (CheckIn checkIn) {
            return SizedBox(height: 10);
          },
          itemBuilder: (context, CheckIn checkIn) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23.0, vertical: 13),
                child: _buildCheckInCard(checkIn, context));
          },
          groupBy: _bloc.checkInGrouper,
        ),
      );
    }

    // TODO: make proper error message
    return Text('HHH něco se pokakalo');
  }

  Widget _buildErrorMessage(
    OperationException? exception,
    BuildContext context,
  ) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            s.getCheckInsFailTitle,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 30,
          ),
          if (exception != null)
            ListView.builder(
                shrinkWrap: true,
                itemCount: exception.graphqlErrors.length,
                itemBuilder: (context, i) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(exception.graphqlErrors[i].extensions?['code'] ??
                          s.getCheckInsFailNoCodeGiven),
                      Text(exception.graphqlErrors[i].message),
                    ],
                  );
                })
        ],
      ),
    );
  }

  Widget _buildCheckInCard(CheckIn checkIn, BuildContext context) {
    return CekInCard(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: context.colors.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.login,
                  size: context.mediaQuery.size.width / 6,
                  color: context.colors.onPrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CekInVerticalDivider(),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    checkIn.place.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '${s.checkedInDate}: ${DateFormatter.toSimpleDate(checkIn.checkInTime.toDateTime)}',
                    style: context.textTheme.caption,
                  ),
                  Text(
                    '${s.checkedInTime}: ${DateFormatter.toSimpleHourMinute(checkIn.checkInTime.toDateTime)}',
                    style: context.textTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.checkInDetails, arguments: checkIn);
      },
    );
  }
}
