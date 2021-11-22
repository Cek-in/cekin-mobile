import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../api_address.dart';
import '../auth/auth.dart';

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
}
