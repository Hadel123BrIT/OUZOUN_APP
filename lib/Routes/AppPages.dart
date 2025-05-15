import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import 'package:ouzoun/Views/Doctor_Choices/second_page_choices.dart';
import 'package:ouzoun/Views/Splash_View/Splash_screen/splash_screen.dart';

import '../Views/Doctor_Choices/first_page_choices.dart' show FirstPageChoices;
import '../Views/Login_View/login_screen.dart';
import '../Views/Register_View/register_screen.dart';



class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),

    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),

    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),

    ),
    GetPage(
      name: AppRoutes.firstchoice,
      page: () => FirstPageChoices(),

    ),
    GetPage(
      name: AppRoutes.firstchoice,
      page: () => FirstPageChoices(),

    ),
    GetPage(
      name: AppRoutes.secondchoice,
      page: () =>SecondPageChoices(),

    ),

  ];
}



