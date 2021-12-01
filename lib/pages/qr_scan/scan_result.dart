import '../../external/graphql_api.dart';
import 'qr_scan_model.dart';

class ScanResultObject {
  final ScanResult result;
  QRScan? scan;
  GetPlace$Query$Place? place;

  ScanResultObject({
    required this.result,
    this.scan,
    this.place,
  })
  // Making sure that we don't receive successful result with null data
  // or fail result with non null data.
  : assert((result == ScanResult.success && scan != null && place != null) ||
            (result != ScanResult.success && scan == null && place == null));
}

enum ScanResult {
  success,
  invalidFormat,
  fail,
}
