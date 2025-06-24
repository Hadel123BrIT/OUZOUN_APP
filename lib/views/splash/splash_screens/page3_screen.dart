import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ouzoun/Core/Services/media_query_service.dart';
import '../../../Widgets/CustomText.dart';
import '../../../core/constants/app_images.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
  final media=MediaQueryHelper(context);

    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't worry".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: media.height * 0.02),
            Text("this App helps you, Let's start".tr,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium,),
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