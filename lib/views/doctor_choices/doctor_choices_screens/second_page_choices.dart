// second_page_choices.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ouzoun/Routes/app_routes.dart';
 // show AppAssets;

import '../../../Widgets/CustomText.dart';
import '../../../Widgets/BuildChoiceCard.dart';
import '../../../Widgets/CustomAwesomeDialog.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../Doctor_choices_controller/doctor_choices_controller.dart';

class SecondPageChoices extends StatelessWidget {
  SecondPageChoices({super.key});

  final DoctorChoicesController controller = Get.put(DoctorChoicesController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: const DecorationImage(
                opacity: 0.8,
                image: AssetImage(AppAssets.choice2Page),
                fit: BoxFit.fitWidth,
              ),
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              children: [
                const SizedBox(height: 70),
                Text(
                  "please choose.\nHow can we help you",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: screenSize.height * 0.4),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Obx(() => BuildChoiceCard(
                            color: green,
                            height: isPortrait
                                ? screenSize.height * 0.20
                                : screenSize.height * 0.4,
                            icon: FontAwesomeIcons.handsHelping,
                            onTap: () => showAssistantDialog(context),
                            subtitle: controller.selectedAssistants.value > 0
                                ? '${controller.selectedAssistants.value} assistant(s)'
                                : '',
                            textColor: background,
                            title: 'With an assistant',
                          )),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child:  BuildChoiceCard(
                            color: green,
                            height: isPortrait
                                ? screenSize.height * 0.20
                                : screenSize.height * 0.4,
                            icon: FontAwesomeIcons.userSlash,
                            onTap: () {
                              controller.selectedAssistants.value = 0;
                              controller.showNextButton.value = true;
                              controller.withoutAssistantClicked.value = true;
                            },
                            subtitle: controller.withoutAssistantClicked.value
                                ? '${controller.selectedAssistants.value} assistant(s)'
                                : '',
                            textColor: background,
                            title: 'without an assistant',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => controller.showNextButton.value && controller.selectedAssistants.value >= 0
              ? Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child:    GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.homepage);
                  },
                  child:  Text("next".tr,
                    textAlign: TextAlign.center,style:Theme.of(context).textTheme.headlineSmall,)
              ),
            ),
          )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}