import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Core/Constances/all_images.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';

import '../../../Core/Constances/all_colors.dart';
import '../../../Widgets/CustomText.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
  final media=MediaQueryHelper(context);

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Customtext(
              textAlign: TextAlign.center,
              fontFamily: 'Ubuntu',
              fontSize:media.isPortrait
                  ? media.width * 0.1
                  : media.height * 0.1,
              isbold: true,
              color: Colors.black87,
              text: "Don't worry",
            ),
            SizedBox(height: media.height * 0.02),
            Customtext(
              textAlign: TextAlign.center,
              max: 2,
              fontFamily: 'Montserrat',
              fontSize:media.isPortrait
                  ? media.width * 0.06
                  : media.height * 0.06,
              isbold: false,
              color: Colors.grey.withOpacity(0.7),
              text: "this App helps you, Let's start",
            ),
            SizedBox(height: media.height * 0.065),
            Image.asset(
              AppAssets.page3,
              scale: media.width * 0.005,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}