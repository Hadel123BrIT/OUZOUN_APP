import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import 'package:ouzoun/Views/Doctor_Choices/Doctor_choices_screens/second_page_choices.dart';
import 'package:ouzoun/Views/Splash_View/Splash_screen/splash_screen.dart';

import '../Views/Book_Tools/Book_Tools_Screen/book_tools_screen.dart';
import '../Views/Doctor_Choices/Doctor_choices_screens/first_page_choices.dart' show FirstPageChoices;
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
      name: AppRoutes.secondchoice,
      page: () =>SecondPageChoices(),

    ),
    GetPage(
      name: AppRoutes.bookTool,
      page: () =>BookToolsScreen(),

    ),
  ];
}



