import 'dart:async';

class SignUpBloc {
  final StreamController<bool> _isLoadingController =
      StreamController.broadcast();

  SignUpBloc();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;
}
