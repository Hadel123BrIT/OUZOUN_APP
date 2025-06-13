import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("And".tr,
              textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: media.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: media.width * 0.05
              ),
              child: Text("you Find difficult to choose the assistant and tools".tr,
                textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
            ),
            SizedBox(height: media.height * 0.07),
            Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? AppAssets.page2
                  : AppAssets.page2_white,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}