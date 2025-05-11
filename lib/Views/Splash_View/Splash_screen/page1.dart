import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../Core/Constances/all_colors.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              "Welcome",
              style: TextStyle(
                fontSize: isPortrait
                    ? screenWidth * 0.1
                    : screenHeight * 0.1,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              "Are you a dentist?",
              style: TextStyle(
                fontSize: isPortrait
                    ? screenWidth * 0.06
                    : screenHeight * 0.06,
                color: Colors.grey[700],
              ),
            ),

            SizedBox(height: screenHeight * 0.07),
            SizedBox(
              width: isPortrait
                  ? screenWidth * 0.7
                  : screenHeight * 0.7,
              child: Image.asset(
                'assets/icons/dentist person.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}