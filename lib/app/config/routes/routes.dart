import 'package:get/route_manager.dart';
import 'package:tickets/app/config/routes/route_path.dart';
import 'package:tickets/presentation/authentication/controller/login_binding.dart';
import 'package:tickets/presentation/authentication/view/login_page.dart';
import 'package:tickets/presentation/authentication/view/register_profile_page.dart';
import 'package:tickets/presentation/authentication/view/request_permission_page.dart';
import 'package:tickets/presentation/authentication/view/select_category_page.dart';
import 'package:tickets/presentation/authentication/view/term_agree_page.dart';
import 'package:tickets/presentation/authentication/view/term_detail_page.dart';
import 'package:tickets/presentation/main/controller/main_binding.dart';
import 'package:tickets/presentation/main/view/main_page.dart';
import 'package:tickets/presentation/main/view/ticket_search_page.dart';
import 'package:tickets/presentation/main/view/ticket_search_result_page.dart';

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
      name: RoutePath.registerProfile,
      page: () => const RegisterProfilePage(),
    ),
    GetPage(
      name: RoutePath.requestPermssion,
      page: () => const RequestPermissionPage(),
    ),
    GetPage(
      name: RoutePath.selectCategory,
      page: () => const SelectCategoryPage(),
    ),
    GetPage(
      name: RoutePath.termAgree,
      page: () => const TermAgreePage(),
    ),
    GetPage(
      name: RoutePath.termDetail,
      page: () => TermDetailPage(),
    ),

    // Main
    GetPage(
      name: RoutePath.main,
      page: () => const MainPage(),
      binding: HomeBinding(),
    ),

    // Main - Ticket Search
    GetPage(
      name: RoutePath.ticketSearch,
      page: () => const TicketSearchPage(),
    ),
    GetPage(
      name: RoutePath.ticketSearchResult,
      page: () => const TicketSearchResultPage(),
    ),
  ];
}
