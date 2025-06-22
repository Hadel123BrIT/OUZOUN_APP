import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import 'package:ouzoun/Views/HomePage_View/HomePage_Screen/homePage_screen.dart';
import 'package:ouzoun/Views/Kits_Views/Kits_Screens/Additional%20Kits.dart';
import 'package:ouzoun/Views/Kits_Views/Kits_Screens/Implant%20Kits.dart';
import 'package:ouzoun/Views/Kits_Views/Kits_Screens/Surgical%20%20Kits.dart';
import 'package:ouzoun/Views/Kits_Views/Kits_Screens/detail%20kit.dart';
import 'package:ouzoun/Views/Setting_View/Setting_Screen/setting_screen.dart';
import '../Views/Doctor_Choices_View/Doctor_choices_screens/first_page_choices.dart';
import '../Views/Doctor_Choices_View/Doctor_choices_screens/second_page_choices.dart';
import '../Views/ForgetPassword_View/ForgetPassword_Screens/chekemail.dart';
import '../Views/ForgetPassword_View/ForgetPassword_Screens/code.dart';
import '../Views/ForgetPassword_View/ForgetPassword_Screens/resetpasswordpage.dart';
import '../Views/HomePage_View/HomePage_Controller/homePage_controller.dart';
import '../Views/Login_View/login_screen.dart';
import '../Views/MyProfile_View/MyProfile_Screen/myProfile_screen.dart';
import '../Views/Register_View/register_screen.dart';
import '../Views/Splash_View/Splash_screen/splash_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.detail_kit,
      page: () => ImplantDetailScreen(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => MyprofileScreen(),
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
      name: AppRoutes.chekEmail,
      page: () =>Chekemail(),

    ),
    GetPage(
      name: AppRoutes.code,
      page: () =>Code(),

    ),
    GetPage(
      name: AppRoutes.resetpage,
      page: () =>Resetpasswordpage(),

    ),
    GetPage(
      name: AppRoutes.homepage,
      page: () =>HomePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomePageController());
      }),
    ),
    GetPage(
      name: AppRoutes.surgical_kit,
      page: () =>SurgicalKits(),

    ),
    GetPage(
      name: AppRoutes.additional_kit,
      page: () =>AdditionalKits(),

    ),
    GetPage(
      name: AppRoutes.implant_kit,
      page: () =>Implantkits(),

    ),
  ];
}



