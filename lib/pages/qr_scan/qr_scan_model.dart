//ignore_for_file: lines_longer_than_80_chars
class QRScan {
  final DateTime created;
  final String hash;
  final double lat;
  final double lon;
  final DateTime printed;

  QRScan({
    required this.created,
    required this.hash,
    required this.lat,
    required this.lon,
    required this.printed,
  }) : assert(printed.isAfter(created));

  // 0     1      2          3          4              5             6
  //cekin:qr:<qr created>:<qr hash>:<place latitude>:<qr printed>:<place longitude>
  String get toCode =>
      'cekin:qr:${created.millisecondsSinceEpoch}:$hash:$lat:${printed.millisecondsSinceEpoch}:$lon';
}
