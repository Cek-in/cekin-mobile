extension DateInt on int {
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
}
