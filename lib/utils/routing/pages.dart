import '../../pages/check_in_details/check_in_details_bloc.dart';
import '../../pages/check_in_details/check_in_details_page.dart';
import '../../pages/home/home_bloc.dart';
import '../../pages/home/home_page.dart';
import '../../pages/init/init_bloc.dart';
import '../../pages/init/init_page.dart';
import '../../pages/login/forgot_password_page.dart';
import '../../pages/login/login_bloc.dart';
import '../../pages/login/login_page.dart';
import '../../pages/qr_scan/qr_scan_bloc.dart';
import '../../pages/qr_scan/qr_scan_page.dart';
import '../../pages/sign_up/sign_up_bloc.dart';
import '../../pages/sign_up/sign_up_page.dart';
import '../../utils/types.dart';

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

  static checkInDetailsPage(CheckIn checkIn) {
    final bloc = CheckInDetailsBloc(checkIn);
    return CheckInDetailsPage(bloc);
  }

  static qrScanPage() {
    final bloc = QRScanBloc();
    return QRScanPage(bloc);
  }

  static signUpPage() {
    final bloc = SignUpBloc();
    return SignUpPage(bloc);
  }

  static forgotPasswordPage() {
    return ForgotPasswordPage();
  }
}
