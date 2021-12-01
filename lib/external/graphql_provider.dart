import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../api_address.dart';
import '../auth/auth.dart';
import '../utils/action_result.dart';
import '../utils/logger.dart';
import '../utils/preferences.dart';
import 'gql_results.dart';
import 'graphql_api.graphql.dart';

class GQLProvider {
  static GQLProvider i = GQLProvider._();

  ValueNotifier<GraphQLClient>? client;

  GQLProvider._();

  Future<void> init() async {
    await initHiveForFlutter();
    final HttpLink httpLink = HttpLink(api);
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${await Auth.i.getToken()}',
    );
    final Link link = authLink.concat(httpLink);
    client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
  }

  Future<ActionResult<GQLResults, CreateUser$Mutation$User?>> createUser(
    fName,
  ) async {
    final res = await GQLProvider.i.client!.value.mutate(
      MutationOptions(
          document: CreateUserMutation(
            variables: CreateUserArguments(
              user: CreateUserInput(
                firstName: fName,
                languageCode: Preferences.i.localePreference,
              ),
            ),
          ).document,
          variables: {
            'user': {
              'firstName': fName,
              'languageCode': Preferences.i.localePreference,
            }
          }),
    );
    if (res.hasException) {
      Log.i.error(res.exception!.graphqlErrors.toString());
      return ActionResult(result: GQLResults.fail);
    }
    if (res.data == null) {
      return ActionResult(result: GQLResults.fail);
    }
    try {
      final mutationResult =
          CreateUser$Mutation$User.fromJson(res.data!['createUser']);
      return ActionResult(result: GQLResults.success, value: mutationResult);
    } catch (e) {
      return ActionResult(result: GQLResults.fail);
    }
  }

  Future<ActionResult<GQLResults, GetPlace$Query$Place?>> getPlace(
    qrValue,
  ) async {
    final res = await GQLProvider.i.client!.value.query(
      QueryOptions(
          document: GetPlaceQuery(
            variables: GetPlaceArguments(
              qrValue: qrValue,
            ),
          ).document,
          variables: {
            'qrValue': qrValue,
          }),
    );
    if (res.hasException) {
      Log.i.error(res.exception!.graphqlErrors.toString());
      return ActionResult(result: GQLResults.fail);
    }
    if (res.data == null) {
      return ActionResult(result: GQLResults.fail);
    }
    try {
      final queryResult = GetPlace$Query$Place.fromJson(res.data!['place']);
      return ActionResult(result: GQLResults.success, value: queryResult);
    } catch (e) {
      return ActionResult(result: GQLResults.fail);
    }
  }

  Future<ActionResult<GQLResults, void>> checkIn(
    qrValue,
  ) async {
    final res = await GQLProvider.i.client!.value.mutate(
      MutationOptions(
          document: CheckInMutation(
            variables: CheckInArguments(
              qrValue: qrValue,
            ),
          ).document,
          variables: {
            'qrValue': qrValue,
          }),
    );
    if (res.hasException) {
      Log.i.error(res.exception!.graphqlErrors.toString());
      return ActionResult(result: GQLResults.fail);
    }
    if (res.data == null) {
      return ActionResult(result: GQLResults.fail);
    }
    try {
      if (res.data!['checkIn']) {
        return ActionResult(result: GQLResults.success);
      }
      return ActionResult(result: GQLResults.fail);
    } catch (e) {
      return ActionResult(result: GQLResults.fail);
    }
  }
}
