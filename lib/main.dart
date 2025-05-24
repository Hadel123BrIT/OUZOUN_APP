import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Core/Constances/theme.dart';
import 'package:ouzoun/Core/Localization/changlang.dart';
import 'package:ouzoun/Core/Localization/translation.dart';
import 'package:ouzoun/Core/Services/services.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import 'package:ouzoun/Test.dart';
import 'package:ouzoun/Views/Splash_View/Splash_screen/splash_screen.dart';
import 'Binding/AuthBinding/initalize_binding.dart';
import 'Routes/AppPages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ChangeLangController controller= Get.put(ChangeLangController());;
    return GetMaterialApp(
        translations:MyTranslatin(),
       // initialRoute: AppRoutes.splash,
        locale:controller.Lang,
        initialBinding:InitalizeBindingAuth(),
        getPages: AppPages.pages,
        theme:lightMode,
        darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
    );
  }
}


