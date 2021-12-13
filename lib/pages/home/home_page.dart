import 'package:cek_in/pages/home/checkins.dart';
import 'package:cek_in/ui/tab_bar_indicator.dart';
import 'package:cek_in/utils/context_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../auth/auth.dart';
import '../../strings/strings_provider.dart';
import '../../ui/dialogs.dart';
import '../../ui/sliver_app_bar.dart';
import '../../utils/routing/routes.dart';
import '../qr_scan/scan_result.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final HomePageBloc bloc;

  const HomePage(this.bloc, {Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final s = StringsProvider.i.strings.home;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      // SingleChildScrollView(
      //   physics: const BouncingScrollPhysics(
      //       parent: AlwaysScrollableScrollPhysics()),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 12.0),
      //     child: CheckIns(widget.bloc),
      //   ),
      // ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: onScanTapped,
        backgroundColor: context.colors.primary,
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
          child: Icon(
            Icons.camera_alt_rounded,
            color: context.colors.onPrimary,
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 17.0),
                child: SvgPicture.asset(
                  'assets/images/cekin-full.svg',
                  width: context.mediaQuery.size.width / 3,
                  color: context.colors.primary,
                ),
              ),
              Text(s.title, style: context.textTheme.headline3),
              SizedBox(height: 10),
              TabBar(
                controller: tabController,
                indicator: TabBarIndicator(colour: context.colors.primary),
                enableFeedback: true,
                tabs: [
                  Tab(
                    child: Text('Today', style: context.textTheme.subtitle1),
                  ),
                  Tab(
                    child:
                        Text('Yesterday', style: context.textTheme.subtitle1),
                  ),
                  Tab(
                    child: Text('Older', style: context.textTheme.subtitle1),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Dialogs.confirmDialog(
                  context: context,
                  question: s.logoutQuestion,
                  cancelButton: s.btCancelLogout,
                  confirmButton: s.btConfirmLogin,
                  onSuccess: Auth.i.logout);
            },
          ),
        ],
      ),
    );
  }

  Future<void> onScanTapped() async {
    final ScanResultObject scanResult = await Navigator.of(context)
        .pushNamed(Routes.qrScan) as ScanResultObject;
    switch (scanResult.result) {
      case ScanResult.success:
        await Dialogs.confirmCheckIn(
          context: context,
          continueButton: s.btScanDialogContinue,
          title: s.scanDialogConfirmTitle,
          message: s.scanDialogConfirmMessage,
          place: scanResult.place!.name,
          cancelButton: s.btScanDialogCancel,
          onConfirm: () async {
            final checkInResult =
                await widget.bloc.checkIn(scanResult.scan!.toCode);
            handleCheckInResult(checkInResult);
          },
        );
        break;
      case ScanResult.invalidFormat:
        await Dialogs.alertDialog(
          context: context,
          title: s.scanDialogFailureTitle,
          message: s.scanDialogInvalidFormat,
          continueButton: s.btScanDialogContinue,
        );
        break;
      case ScanResult.fail:
        await Dialogs.alertDialog(
          context: context,
          title: s.scanDialogFailureTitle,
          message: s.scanDialogFail,
          continueButton: s.btScanDialogContinue,
        );
        break;
    }
  }

  void handleCheckInResult(CheckInResults result) {
    if (result == CheckInResults.success) {
      Dialogs.alertDialog(
        context: context,
        title: s.checkInDialogSuccessTitle,
        message: s.checkInDialogSuccess,
        continueButton: s.btCheckInDialogContinue,
      );
    } else {
      Dialogs.alertDialog(
        context: context,
        title: s.checkInDialogFailTitle,
        message: s.checkInDialogFail,
        continueButton: s.btCheckInDialogContinue,
      );
    }
  }

  Widget buildBody() {
    final now = DateTime.now();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildHeader(),
        Flexible(
          child: TabBarView(
            controller: tabController,
            children: [
              CheckIns(
                widget.bloc,
                start: now.subtract(
                  Duration(
                    hours: now.hour,
                    minutes: now.minute,
                  ),
                ),
                end: now.add(
                  Duration(
                    hours: 24 - now.hour,
                    minutes: 60 - now.minute,
                  ),
                ),
              ),
              CheckIns(
                widget.bloc,
                start: now.subtract(
                  Duration(
                    hours: now.hour,
                    minutes: now.minute,
                  ),
                ),
                end: now.add(
                  Duration(
                    hours: 24 - now.hour,
                    minutes: 60 - now.minute,
                  ),
                ),
              ),
              CheckIns(
                widget.bloc,
                start: now.subtract(
                  Duration(
                    hours: now.hour,
                    minutes: now.minute,
                  ),
                ),
                end: now.add(
                  Duration(
                    hours: 24 - now.hour,
                    minutes: 60 - now.minute,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
