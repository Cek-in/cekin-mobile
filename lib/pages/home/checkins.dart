import 'package:cek_in/ui/card.dart';
import 'package:cek_in/ui/divider.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../external/graphql_api.dart';
import '../../strings/strings_provider.dart';
import '../../utils/date_time_extension.dart';
import '../../utils/logger.dart';
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
        shrinkWrap: true,
        elements: checkIns.value!,
        order: GroupedListOrder.DESC,
        groupComparator: _bloc.checkInGroupComparator,
        separator: CekInDivider(),
        groupHeaderBuilder: (GetCheckIns$Query$CheckIn checkIn) {
          return Padding(
            padding: const EdgeInsets.only(top: 17.0, bottom: 4.0, left: 5.0),
            child: Text(
              DateTime.fromMillisecondsSinceEpoch(checkIn.checkInTime)
                  .toSimpleString,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          );
        },
        itemBuilder: (context, GetCheckIns$Query$CheckIn checkIn) {
          return CekInCard(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                checkIn.place.name,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            onTap: () {},
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
