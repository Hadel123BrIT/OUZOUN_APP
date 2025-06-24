import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../Core/Services/media_query_service.dart';
import '../../../Widgets/custom_text.dart';
import '../../../core/constants/app_images.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQueryHelper(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome".tr,
              textAlign:TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: media.height * 0.03),
            Text("Are you a dentist?".tr,
              textAlign: TextAlign.center,
              style:Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: media.height * 0.1),
            Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? AppAssets.onboarding1DarkBackground
                  : AppAssets.onboarding1LightBackground,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}