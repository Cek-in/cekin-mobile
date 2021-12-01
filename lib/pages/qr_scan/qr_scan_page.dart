import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../strings/strings_provider.dart';
import '../../ui/loading_overlay.dart';
import 'qr_scan_bloc.dart';

class QRScanPage extends StatefulWidget {
  final QRScanBloc bloc;
  const QRScanPage(this.bloc, {Key? key}) : super(key: key);

  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey qrKey = GlobalKey();
  Barcode? result;
  QRViewController? controller;
  bool scan = true;
  final s = StringsProvider.i.strings.qrScan;

  void _onQRViewCreated(QRViewController controller, BuildContext ctx) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.format == BarcodeFormat.qrcode &&
          scanData.code!.length > 20 &&
          scan) {
        setState(() {
          scan = false;
        });
        await controller.pauseCamera();
        final data = await widget.bloc.getResultData(scanData);
        Navigator.pop(ctx, data);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(s.scanQrTitle),
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      ),
      body: LoadingOverlay(
        isLoading: widget.bloc.loadingStream,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) =>
                      _onQRViewCreated(controller, context),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  // margin: const EdgeInsets.only(top: 80),
                  height: MediaQuery.of(context).size.width * .68,
                  width: MediaQuery.of(context).size.width * .68,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.8),
                  BlendMode.srcOut,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        backgroundBlendMode: BlendMode.dstOut,
                      ), // This one will handle background + difference out
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        // margin: const EdgeInsets.only(top: 80),
                        height: MediaQuery.of(context).size.width * .68,
                        width: MediaQuery.of(context).size.width * .68,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(width: 3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Text(
                    s.scanQrTutorial,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
