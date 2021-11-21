class ActionResult<R, O> {
  final R result;
  final O? value;

  ActionResult({
    required this.result,
    this.value,
  });

  bool get hasData => value != null;
}
