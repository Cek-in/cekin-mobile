import 'dart:async';

class SignUpBloc {
  final StreamController<bool> _isLoadingController =
      StreamController.broadcast();

  SignUpBloc();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  Future<String?> submit(String email, String password) async {
    _isLoadingController.add(true);

    _isLoadingController.add(false);
  }
}
