import 'package:get/route_manager.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/presentation/authentication/view/login_page.dart';
import 'package:tickets/presentation/authentication/view/term_agree_page.dart';

class Routes {
  static List<GetPage> routes = [
    // Authentication - Login
    GetPage(
      name: RoutePath.login,
      page: () => const LoginPage(),
    ),
  ];
}
