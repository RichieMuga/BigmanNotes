import 'package:bigmannotes/main.dart';
import 'package:bigmannotes/views/dashboard.dart';
import 'package:bigmannotes/views/home_page.dart';
import 'package:bigmannotes/views/login_view.dart';
import 'package:bigmannotes/views/register_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const HOMEPAGE = '/splashScreen';
  static const DASHBOARD = '/dashboard';
  static const LANDINGPAGE = '/landingPage';

  static final routes = [
    GetPage(name: LOGIN, page: () => const LoginView()),
    GetPage(name: HOMEPAGE, page: () => HomePage()),
    GetPage(name: REGISTER, page: () => const RegisterView()),
    GetPage(name: DASHBOARD, page: () => const Dashboard()),
    GetPage(name: LANDINGPAGE, page: () => const LandingPage()),
  ];
}
