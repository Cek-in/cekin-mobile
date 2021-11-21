import '../../pages/home/home_bloc.dart';
import '../../pages/home/home_page.dart';
import '../../pages/init/init_bloc.dart';
import '../../pages/init/init_page.dart';
import '../../pages/login/forgot_password_page.dart';
import '../../pages/login/login_bloc.dart';
import '../../pages/login/login_page.dart';
import '../../pages/sign_up/sign_up_bloc.dart';
import '../../pages/sign_up/sign_up_page.dart';

class Pages {
  static HomePage homePage() {
    final bloc = HomePageBloc();
    return HomePage(bloc);
  }

  static InitPage initPage() {
    final bloc = InitPageBloc();
    return InitPage(bloc);
  }

  static loginPage() {
    final bloc = LoginPageBloc();
    return LoginPage(bloc);
  }

  static signUpPage() {
    final bloc = SignUpBloc();
    return SignUpPage(bloc);
  }

  static forgotPasswordPage() {
    return ForgotPasswordPage();
  }
}
