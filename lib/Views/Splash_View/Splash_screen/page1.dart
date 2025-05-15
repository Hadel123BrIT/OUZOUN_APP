import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome".tr,textAlign:TextAlign.center,style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: media.height * 0.03),
            Text("Are you a dentist?".tr,textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
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