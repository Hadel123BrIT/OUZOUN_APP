

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Routes/app_routes.dart';
import '../../../Widgets/build_choice_card.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';

class FirstPageChoices extends StatelessWidget {
  const FirstPageChoices({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: const DecorationImage(
            opacity:0.8,
            scale: 0.40,
            //image: AssetImage(AppAssets.choice1Page),
            image: AssetImage(AppAssets.maleDentistIcon),
            fit: BoxFit.fitWidth,
          ),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Text("Welcome to your app.\n Please select your need.",textAlign:TextAlign.center,style:Theme.of(context).textTheme.titleLarge),
            SizedBox(height: screenSize.height * 0.4),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     BuildChoiceCard(
                        color:AppColors.primaryGreen,
                        height: isPortrait ? screenSize.height * 0.20 : screenSize.height * 0.4,
                        icon: FontAwesomeIcons.userDoctor,
                        onTap: () {
                         Get.toNamed(AppRoutes.secondchoice);
                        },
                        subtitle: '',
                        textColor: AppColors.whiteBackground,
                        title: 'Surgical operation',
                      ),
                    const SizedBox(width: 20),
                   BuildChoiceCard(
                        color:AppColors.primaryGreen,
                        height: isPortrait ? screenSize.height * 0.20 : screenSize.height * 0.4,
                        icon: Icons.inventory_2,
                        onTap: () {

                        },
                        subtitle: '',
                        textColor: AppColors.whiteBackground,
                        title: 'Medical supplies.',
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