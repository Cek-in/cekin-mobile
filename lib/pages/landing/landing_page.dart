import 'package:cek_in/utils/preferences.dart';
import 'package:cek_in/utils/routing/router.dart';

import '../../strings/strings_provider.dart';
import 'background_painter.dart';
import '../../utils/context_provider.dart';
import '../../ui/buttons/primary_button.dart';
import '../../ui/flexible_view.dart';
import '../../utils/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key) {
    // If user was already signed in, skip the sign up offer landing page.
    if (Preferences.i.wasSignedIn) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        AppRouter.i.key.currentState!.pushNamed(Routes.login);
      });
    }
  }

  final s = StringsProvider.i.strings.landing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return FlexibleView(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
            child: CustomPaint(
              painter: BackgroundPainter(context.colors.primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(height: 80),
                buildHeader(context),
                SvgPicture.asset('assets/images/landing_page.svg'),
                Spacer(),
                buildActions(context),
                SizedBox(height: 30),
                buildFooter(context),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
            color: context.colors.onPrimary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              'assets/images/cekin_logo_transparent.svg',
              width: MediaQuery.of(context).size.width / 6,
              color: context.colors.primary,
            ),
          ),
        ),
        Text(
          s.title,
          style: Theme.of(context).textTheme.headline4!.copyWith(
              color: context.colors.onPrimary, fontWeight: FontWeight.bold),
        ),
        Text(
          s.subtitle,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: context.colors.onPrimary, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildActions(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.signUp);
          },
          text: s.btSignUp,
          leading: SvgPicture.asset(
            'assets/images/cekin_logo_transparent.svg',
            color: context.colors.onPrimary,
            width: 25,
          ),
        ),
        SizedBox(height: 20),
        Text(s.alreadyRegistered),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.login);
          },
          child: Text(s.btLogIn),
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.all(4),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        )
      ],
    );
  }

  buildFooter(BuildContext context) {
    return Text(
      s.termsPolicy,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10),
      textAlign: TextAlign.center,
    );
  }
}
