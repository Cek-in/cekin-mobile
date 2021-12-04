import 'package:cek_in/utils/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../external/graphql_api.dart';
import '../../strings/strings_provider.dart';
import '../../ui/card.dart';
import '../../ui/divider.dart';
import '../../utils/date_formatter.dart';
import '../../utils/int_extension.dart';
import '../../utils/logger.dart';
import '../../utils/types.dart';
import 'home_bloc.dart';

class CheckIns extends StatelessWidget {
  final HomePageBloc _bloc;
  final s = StringsProvider.i.strings.home;
  CheckIns(
    this._bloc, {
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
      return GroupedListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        elements: checkIns.value!,
        order: GroupedListOrder.DESC,
        groupComparator: _bloc.checkInGroupComparator,
        itemComparator: _bloc.chekInItemComparator,
        groupHeaderBuilder: (CheckIn checkIn) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CekInDivider(
                padding: EdgeInsets.only(bottom: 4),
              ),
              Text(
                DateFormatter.toSimpleDate(checkIn.checkInTime.toDateTime),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(height: 4),
            ],
          );
        },
        itemBuilder: (context, CheckIn checkIn) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CekInCard(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: checkIn.id,
                      child: Text(
                        checkIn.place.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Text(
                      DateFormatter.toSimpleHourMinute(
                          checkIn.checkInTime.toDateTime),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Routes.checkInDetails, arguments: checkIn);
              },
            ),
          );
        },
        groupBy: _bloc.checkInGrouper,
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
}
