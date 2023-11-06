import 'package:get/route_manager.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/presentation/authentication/controller/login_binding.dart';
import 'package:tickets/presentation/authentication/view/login_page.dart';
import 'package:tickets/presentation/authentication/view/term_agree_page.dart';
import 'package:tickets/presentation/authentication/view/term_detail_page.dart';

class Routes {
  static List<GetPage> routes = [
    // Authentication - Login
    GetPage(
      name: RoutePath.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    // Authentication - Register
    GetPage(
      name: RoutePath.termAgree,
      page: () => const TermAgreePage(),
    ),
    GetPage(
      name: RoutePath.termDetail,
      page: () => TermDetailPage(),
    ),
    ),
  ];
}
