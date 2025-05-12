import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../Core/Constances/all_colors.dart';
import '../../../Core/Constances/all_images.dart';
import '../../../Core/Services/mediaQuery.dart';
import '../../../Widgets/CustomText.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQueryHelper(context);

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Customtext(
              textAlign: TextAlign.center,
              fontFamily: 'Ubuntu',
              fontSize:media.isPortrait
                  ? media.width * 0.1
                  : media.height * 0.1,
              isbold: true,
              color: Colors.black87,
              text: "Welcome",
            ),
            SizedBox(height: media.height * 0.03),
            Customtext(
              textAlign: TextAlign.center,
              fontFamily: 'Montserrat',
              fontSize:media.isPortrait
                  ? media.width * 0.06
                  : media.height * 0.06,
              isbold: false,
              color: Colors.grey.withOpacity(0.7),
              text: "Are you a dentist?",
            ),

            SizedBox(height: media.height * 0.1),
            Image.asset(
              AppAssets.welcomeImage,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}