import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Core/Constances/all_colors.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't worry",
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "this App helps you, Let's start",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.065),
            SizedBox(
              child: Image.asset(
                'assets/icons/dental-care (1).png',
                scale: screenWidth * 0.005,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}