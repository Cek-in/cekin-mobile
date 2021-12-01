import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'auth/auth.dart';
import 'external/graphql_provider.dart';
import 'strings/strings_provider.dart';
import 'utils/preferences.dart';
import 'utils/routing/router.dart';
import 'utils/routing/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userSignedIn = Auth.i.user != null;

    return GraphQLProvider(
      client: GQLProvider.i.client,
      child: MaterialApp(
        title: StringsProvider.i.strings.general.appName,
        onGenerateRoute: AppRouter.i.onGenerateRoute,
        initialRoute: userSignedIn ? Routes.init : Routes.login,
        locale: Locale(Preferences.i.localePreference),
        navigatorKey: AppRouter.i.key,
        theme: Preferences.i.selectedTheme.theme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('cs'),
          Locale('en'),
        ],
      ),
    );
  }
}
