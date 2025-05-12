import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import 'package:ouzoun/Views/Login_View/login_screen.dart';
import 'package:ouzoun/Views/Splash_View/Splash_screen/page1.dart';
import 'package:ouzoun/Views/Splash_View/Splash_screen/page2.dart';
import 'package:ouzoun/Views/Splash_View/Splash_screen/page3.dart';
import '../../../Routes/AppRoutes.dart';
import '../../../Widgets/CustomText.dart';
import '../../../core/constances/all_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  PageController splashController=PageController();
  bool onlastPage=false;
  @override
  Widget build(BuildContext context) {
    @override
    final media = MediaQueryHelper(context);
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          PageView(
            controller: splashController,
            onPageChanged: (index){
              setState(() {
                onlastPage=(index==2);
              });
            },
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Customtext(
                      textAlign: TextAlign.center,
                      fontFamily: 'Montserrat',
                      fontSize:media.width*0.05,
                      isbold: true,
                      color: Colors.black,
                      text: "skip",
                    ),
                    onTap: (){
                      splashController.jumpToPage(2);
                    },
                  ),

                  SmoothPageIndicator(
                    controller: splashController,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: greenlight,
                      dotColor: Colors.grey,
                    ),
                  ),
                  onlastPage?
                  GestureDetector(
                    onTap: (){
                      Get.to(LoginScreen());
                    },
                    child: Customtext(
                      textAlign: TextAlign.center,
                      fontFamily: 'Montserrat',
                      fontSize:media.width*0.05,
                      isbold: true,
                      color: Colors.black,
                      text: "done",
                    ),
                  ):
                  GestureDetector(
                    onTap: (){
                      splashController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut );
                    },
                    child: Customtext(
                      textAlign: TextAlign.center,
                      fontFamily: 'Montserrat',
                      fontSize:media.width*0.05,
                      isbold: true,
                      color: Colors.black,
                      text: "next",
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
