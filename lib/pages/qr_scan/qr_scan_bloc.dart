import 'dart:async';

import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../external/gql_results.dart';
import '../../external/graphql_provider.dart';
import '../../utils/logger.dart';
import '../../utils/validation/validation_string_extension.dart';
import 'qr_scan_model.dart';
import 'scan_result.dart';

class QRScanBloc {
  final StreamController<bool> _isLoadingController = StreamController();

  Stream<bool> get loadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  Future<ScanResultObject?> getResultData(Barcode scanData) async {
    if (scanData.code == null) {
      return ScanResultObject(result: ScanResult.fail);
    }
    final qrData = _parseCode(scanData.code!);
    if (qrData == null) {
      return ScanResultObject(result: ScanResult.invalidFormat);
    }
    _isLoadingController.add(true);
    Log.i.info(scanData.code!.trim());
    final place = await GQLProvider.i.getPlace(scanData.code!.trim());
    _isLoadingController.add(false);
    if (place.result != GQLResults.success) {
      return ScanResultObject(result: ScanResult.invalidFormat);
    }

    return ScanResultObject(
      result: ScanResult.success,
      scan: qrData,
      place: place.value,
    );
  }

  QRScan? _parseCode(String code) {
    try {
      code = code.trim();
      if (!code.isValidCekinQRCode()) {
        return null;
      }

      // 0     1      2          3          4              5             6
      //ignore: lines_longer_than_80_chars
      //cekin:qr:<qr created>:<qr hash>:<place latitude>:<qr printed>:<place longitude>
      final data = code.split(':');

      if (data[0] != 'cekin' || data[1] != 'qr') {
        return null;
      }

      final created = DateTime.fromMillisecondsSinceEpoch(int.parse(data[2]));
      final hash = data[3];
      final lat = double.parse(data[4]);
      final lon = double.parse(data[6]);
      final printed = DateTime.fromMillisecondsSinceEpoch(int.parse(data[5]));
      return QRScan(
        created: created,
        hash: hash,
        lat: lat,
        lon: lon,
        printed: printed,
      );
    } catch (e) {
      Log.i.error('Failed to parse QR code');
      return null;
    }
  }
}
