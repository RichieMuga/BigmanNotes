import 'package:bigmannotes/main.dart';
import 'package:bigmannotes/views/login_view.dart';
import 'package:bigmannotes/views/register_view.dart';
import 'package:bigmannotes/views/verify_email.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../views/splash_screen.dart';

class Routes {
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const SPLASHSCREEN = '/splashScreen';
  static const VERIFYEMAIL = '/verifyEmail';
  static const DASHBOARD = '/dashboard';


  static final routes = [
    GetPage(name: LOGIN, page: () => const LoginView()),
    GetPage(name: SPLASHSCREEN, page: () => const SplashScreen()),
    GetPage(name: REGISTER, page: () => const RegisterView()),
    GetPage(name: VERIFYEMAIL, page: () => const VerifyEmail()),
    GetPage(name: DASHBOARD, page: () => const DashBoard()),
  ];
}
