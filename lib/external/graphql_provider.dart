import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../api_address.dart';
import '../auth/auth.dart';
import '../utils/action_result.dart';
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
    lName,
  ) async {
    final res = await GQLProvider.i.client!.value.mutate(
      MutationOptions(
        document: CreateUserMutation(
          variables: CreateUserArguments(
            user: CreateUserInput(
              firstName: fName,
              lastName: lName,
              languageCode: Preferences.i.localePreference,
            ),
          ),
        ).document,
      ),
    );
    if (res.hasException) {
      return ActionResult(result: GQLResults.fail);
    }
    if (res.data == null) return ActionResult(result: GQLResults.fail);
    try {
      final mutationResult = CreateUser$Mutation$User.fromJson(res.data!);
      return ActionResult(result: GQLResults.success, value: mutationResult);
    } catch (e) {
      return ActionResult(result: GQLResults.fail);
    }
  }
}
