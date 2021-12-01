import 'package:flutter/material.dart';

import '../../auth/auth.dart';
import '../../strings/strings_provider.dart';
import '../../ui/dialogs.dart';
import '../../ui/loading_overlay.dart';
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
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Auth.i.logout();
          },
        ),
      ),
      body: LoadingOverlay(
        isLoading: widget.bloc.isLoadingStream,
        child: CheckIns(widget.bloc),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onScanTapped,
        child: const Icon(
          Icons.qr_code_scanner_outlined,
        ),
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
}
