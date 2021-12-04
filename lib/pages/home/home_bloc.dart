import 'dart:async';

import 'package:cek_in/utils/int_extension.dart';

import '../../external/gql_results.dart';
import '../../external/graphql_api.dart';
import '../../external/graphql_provider.dart';
import '../../utils/action_result.dart';
import '../../utils/logger.dart';

//ignore_for_file:avoid_dynamic_calls
class HomePageBloc {
  final StreamController<bool> _isLoadingController = StreamController();

  HomePageBloc();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  Future<void> Function()? refetchCallback;

  int Function(String, String) get checkInGroupComparator => (a, b) {
        return DateTime.parse(a).compareTo(DateTime.parse(b));
      };

  String Function(GetCheckIns$Query$CheckIn) get checkInGrouper => (checkIn) {
        final date = DateTime.fromMillisecondsSinceEpoch(checkIn.checkInTime);
        return DateTime(date.year, date.month, date.day).toIso8601String();
      };

  int Function(GetCheckIns$Query$CheckIn, GetCheckIns$Query$CheckIn)
      get chekInItemComparator => (a, b) {
            return a.checkInTime.toDateTime.compareTo(b.checkInTime.toDateTime);
          };

  Future<CheckInResults> checkIn(String qrValue) async {
    _isLoadingController.add(true);
    final result = await GQLProvider.i.checkIn(qrValue);
    if (result.result == GQLResults.success) {
      await refetchCallback?.call();
    }
    _isLoadingController.add(false);
    return result.result == GQLResults.success
        ? CheckInResults.success
        : CheckInResults.fail;
  }

  void dispose() {
    _isLoadingController.close();
  }

  ActionResult<CheckInParseResults, List<GetCheckIns$Query$CheckIn>> parseData(
      Map<String, dynamic> data) {
    try {
      final res = List<GetCheckIns$Query$CheckIn>.from(data['ownCheckIns']
          .map<GetCheckIns$Query$CheckIn>(
              (value) => GetCheckIns$Query$CheckIn.fromJson(value)));
      return ActionResult(result: CheckInParseResults.success, value: res);
    } catch (e) {
      Log.i.error(e.toString());
    }
    return ActionResult(result: CheckInParseResults.fail);
  }
}

enum CheckInParseResults {
  success,
  fail,
}

enum CheckInResults {
  success,
  fail,
}
