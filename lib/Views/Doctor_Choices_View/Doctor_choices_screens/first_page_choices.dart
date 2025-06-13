import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Routes/AppRoutes.dart';
import 'package:ouzoun/Widgets/CustomText.dart';
import '../../../Core/Constances/all_colors.dart';
import '../../../Core/Constances/all_images.dart';
import '../../../Widgets/choices_page/buildChoiceCard.dart';

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
            image: AssetImage(AppAssets.Choice1),
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
                     ChoiceCard(
                        color:green,
                        height: isPortrait ? screenSize.height * 0.20 : screenSize.height * 0.4,
                        icon: FontAwesomeIcons.userDoctor,
                        onTap: () {
                         Get.toNamed(AppRoutes.secondchoice);
                        },
                        subtitle: '',
                        textColor: background,
                        title: 'Surgical operation',
                      ),
                    const SizedBox(width: 20),
                   ChoiceCard(
                        color:green,
                        height: isPortrait ? screenSize.height * 0.20 : screenSize.height * 0.4,
                        icon: Icons.inventory_2,
                        onTap: () {

                        },
                        subtitle: '',
                        textColor: background,
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