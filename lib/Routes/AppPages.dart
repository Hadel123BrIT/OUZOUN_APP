import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ouzoun/Views/Splash_View/Splash_screen/splash_screen.dart';

import '../Views/Login_View/login_screen.dart';
import '../Views/Register_View/register_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
  ];
}