import 'package:flutter/material.dart';

import '../../pages/error_page.dart';
import '../logger.dart';
import 'pages.dart';
import 'routes.dart';

class AppRouter {
  static final AppRouter i = AppRouter._();
  final GlobalKey<NavigatorState> key = GlobalKey();
  final _logger = Log.i;

  AppRouter._();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        _logger.info('Routing to home page');
        return route(Pages.homePage());
      case Routes.init:
        _logger.info('Routing to init page');
        return route(Pages.initPage());
      default:
        _logger.warn('Invalid route given');
        return MaterialPageRoute(builder: (c) => const ErrorPage());
    }
  }

  static forceErrorPage() {
    AppRouter.i.key.currentState!
        .pushNamedAndRemoveUntil(Routes.error, (Route<dynamic> route) => false);
  }

  MaterialPageRoute route(page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
