import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import 'package:ouzoun/Views/Splash_View/Splash_screen/splash_screen.dart';

import 'Routes/AppPages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: AppRoutes.splash,
        getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      home:SplashScreen()
    );
  }
}


