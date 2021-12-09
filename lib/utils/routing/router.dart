import 'package:flutter/material.dart';

import '../../pages/error_page.dart';
import '../../utils/types.dart';
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
        return route(Pages.homePage());
      case Routes.init:
        return route(Pages.initPage());
      case Routes.login:
        return route(Pages.loginPage());
      case Routes.checkInDetails:
        return route(Pages.checkInDetailsPage(settings.arguments as CheckIn));
      case Routes.signUp:
        return route(Pages.signUpPage());
      case Routes.landing:
        return route(Pages.landingPage());
      case Routes.forgotPassword:
        return route(Pages.forgotPasswordPage());
      case Routes.qrScan:
        return route(Pages.qrScanPage());
      case Routes.error:
        return MaterialPageRoute(builder: (c) => const ErrorPage());
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
