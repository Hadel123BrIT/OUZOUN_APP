

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import '../../../Core/Constances/all_colors.dart';
import '../../../Core/Constances/all_images.dart' show AppAssets;
import '../../../Widgets/CustomText.dart';
import '../../../Widgets/choices_page/buildChoiceCard.dart';

class SecondPageChoices extends StatelessWidget {
  const SecondPageChoices({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return  Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: const DecorationImage(
            opacity:0.8,
            image: AssetImage(AppAssets.Choice2),
            fit: BoxFit.fitWidth,
          ),
          color:Theme.of(context).colorScheme.background,
        ),
        child: Column(
          children: [
            SizedBox(height: 70),
            Text("please choose.\nHow can we help you",textAlign:TextAlign.center,style:Theme.of(context).textTheme.titleLarge),
            SizedBox(height: screenSize.height * 0.4),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     ChoiceCard(
                        color:green,
                        height: isPortrait ? screenSize.height * 0.20 : screenSize.height * 0.4,
                        icon: FontAwesomeIcons.handsHelping,
                        onTap: () {
                          Get.toNamed(AppRoutes.bookTool);
                        },
                        subtitle: '',
                        textColor: background,
                        title: 'With an assistant',
                      ),

                    const SizedBox(width: 20),
                     ChoiceCard(
                        color:green,
                        height: isPortrait ? screenSize.height * 0.20 : screenSize.height * 0.4,
                        icon:FontAwesomeIcons.userSlash,
                        onTap: () {
                          Get.toNamed(AppRoutes.bookTool);
                        },
                        subtitle: '',
                        textColor: background,
                        title: 'without an assistant',
                      ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
