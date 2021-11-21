import '../../auth/auth.dart';

class InitPageBloc {
  void init() {
    Auth.i.setAuthListener();
  }
}
