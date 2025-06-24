import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouzoun/views/splash/splash_screens/splash_screen.dart';
import 'routes/app_pages.dart';
import 'core/constants/theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: AppPages.pages,
        theme:lightMode,
        darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        home: SplashScreen()

    );
  }

}


