import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../auth/auth.dart';
import '../../strings/strings_provider.dart';
import '../../ui/dialogs.dart';
import '../../ui/loading_overlay.dart';
import '../../ui/sliver_app_bar.dart';
import '../../utils/routing/routes.dart';
import '../qr_scan/scan_result.dart';
import 'checkins.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final HomePageBloc bloc;

  const HomePage(this.bloc, {Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final s = StringsProvider.i.strings.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: widget.bloc.isLoadingStream,
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => buildHeader(),
          body: RefreshIndicator(
            onRefresh: () async {
              await widget.bloc.refetchCallback?.call();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CheckIns(widget.bloc),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onScanTapped,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icon/Icon.png'),
        ),
      ),
    );
  }

  List<Widget> buildHeader() {
    return [
      CekInSliverAppBar(
        title: s.title,
        expandedSpace: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SvgPicture.asset(
            'assets/images/cekin-full.svg',
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        pinned: true,
        leading: IconButton(
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
      ),
    ];
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
}
