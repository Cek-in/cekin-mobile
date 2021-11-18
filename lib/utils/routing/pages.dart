import '../../pages/home/home_page.dart';
import '../../pages/init/init_bloc.dart';
import '../../pages/init/init_page.dart';

class Pages {
  static HomePage homePage() => const HomePage();
  static InitPage initPage() {
    final bloc = InitPageBloc();
    return InitPage(bloc);
  }
}
