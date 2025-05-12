import 'package:flutter/material.dart';
import 'package:ouzoun/Core/Constances/all_images.dart';
import 'package:ouzoun/Core/Services/mediaQuery.dart';
import '../../../Core/Constances/all_colors.dart';
import '../../../Widgets/CustomText.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final media=MediaQueryHelper(context);

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
              text: "And",
            ),

            SizedBox(height: media.height * 0.03),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: media.width * 0.05
              ),
              child: Customtext(
                textAlign: TextAlign.center,
                max: 2,
                fontFamily: 'Montserrat',
                fontSize:media.isPortrait
                    ? media.width * 0.06
                    : media.height * 0.06,
                isbold: false,
                color: Colors.grey.withOpacity(0.7),
                text: "you Find difficult to choose the assistant and tools",
              ),
            ),

            SizedBox(height: media.height * 0.07),

            Image.asset(
              AppAssets.page2,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}