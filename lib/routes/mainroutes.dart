import 'package:bigmannotes/views/login_view.dart';
import 'package:bigmannotes/views/register_view.dart';
import 'package:bigmannotes/views/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const SPLASHSCREEN = '/splashScreen';

  static final routes = [
    GetPage(name: LOGIN, page: () => const LoginView()),
    GetPage(name: SPLASHSCREEN, page: () => SplashScreen()),
    GetPage(name: REGISTER, page: () => const RegisterView()),
  ];
}
