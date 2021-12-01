import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../external/graphql_api.dart';
import '../../strings/strings_provider.dart';
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
          children: <Widget>[
            if (result.isLoading) const LinearProgressIndicator(),
            if (result.data != null) _buildCheckInsCards(result.data!),
          ],
        );
      },
    );
  }

  Widget _buildCheckInsCards(Map<String, dynamic> data) {
    final checkIns = _bloc.parseData(data);
    if (checkIns.result == CheckInParseResults.success &&
        checkIns.value != null) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: checkIns.value!.length,
          itemBuilder: (context, i) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      checkIns.value![i].place.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            );
          });
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
