import 'package:flutter/material.dart';
import '../../../Core/Constances/all_colors.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
              "And",
              style: TextStyle(
                fontSize: isPortrait
                    ? screenWidth * 0.1
                    : screenHeight * 0.1,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05
              ),
              child: Text(
                "you Find difficult to choose the assistant and tools",
                style: TextStyle(
                  fontSize: isPortrait
                      ? screenWidth * 0.06
                      : screenHeight * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: screenHeight * 0.07),

            SizedBox(
              width: isPortrait
                  ? screenWidth * 0.7
                  : screenHeight * 0.7,
              child: Image.asset(
                'assets/icons/dentist (1).png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}